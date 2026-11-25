const binary = "/opt/codex-desktop/resources/plugins/openai-bundled/plugins/unified-computer-use/bin/codex-computer-use-linux";
const [method, paramsText = "{}"] = Bun.argv.slice(2);
if (!method) throw new Error("Pass an MCP method and JSON parameters");
const child = Bun.spawn([binary, "mcp"], {
  stdin: "pipe",
  stdout: "pipe",
  stderr: "inherit",
  env: { ...process.env, CODEX_COMPUTER_USE_PERSIST_REMOTE_DESKTOP: "1" },
});
let nextId = 1;
const pending = new Map<number, { resolve: (value: any) => void; reject: (reason: unknown) => void }>();
const reader = (async () => {
  let buffer = "";
  const decoder = new TextDecoder();
  for await (const chunk of child.stdout) {
    buffer += decoder.decode(chunk, { stream: true });
    let end;
    while ((end = buffer.indexOf("\n")) >= 0) {
      const line = buffer.slice(0, end);
      buffer = buffer.slice(end + 1);
      if (!line.trim()) continue;
      const message = JSON.parse(line);
      const waiter = pending.get(message.id);
      if (!waiter) continue;
      pending.delete(message.id);
      if (message.error) waiter.reject(new Error(JSON.stringify(message.error)));
      else waiter.resolve(message.result);
    }
  }
})();
function request(method: string, params: unknown): Promise<any> {
  const id = nextId++;
  return new Promise((resolve, reject) => {
    pending.set(id, { resolve, reject });
    child.stdin.write(JSON.stringify({ jsonrpc: "2.0", id, method, params }) + "\n");
    child.stdin.flush();
  });
}
const timer = setTimeout(() => { child.kill(); console.error("MCP call timed out; outcome must be checked before retrying any mutation."); process.exit(1); }, 45000);
try {
  await request("initialize", { protocolVersion: "2025-03-26", capabilities: {}, clientInfo: { name: "local-computer-use-check", version: "1" } });
  child.stdin.write(JSON.stringify({ jsonrpc: "2.0", method: "notifications/initialized" }) + "\n");
  child.stdin.flush();
  const result = await request(method, JSON.parse(paramsText));
  if (result.structuredContent?.accessibility_tree_spill?.path) {
    result.structuredContent.accessibility_tree = await Bun.file(result.structuredContent.accessibility_tree_spill.path).json();
  }
  if (Array.isArray(result.content)) {
    const images: string[] = [];
    for (const [index, block] of result.content.entries()) {
      if (block.type !== "image") continue;
      const path = `/tmp/opencode/codex-cu-${index}.${block.mimeType === "image/jpeg" ? "jpg" : "png"}`;
      await Bun.write(path, Buffer.from(block.data, "base64"));
      images.push(path);
    }
    console.log(JSON.stringify({ isError: result.isError, images, result: result.structuredContent ?? result.content.filter((b: any) => b.type === "text") }, null, 2));
  } else {
    console.log(JSON.stringify(result, null, 2));
  }
} finally {
  clearTimeout(timer);
  child.kill();
  await reader;
}
