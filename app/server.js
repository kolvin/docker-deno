import { serve } from "./dependices.js";

const PORT = 8000;
const s = serve({ port: PORT });

const body = new TextEncoder().encode("Wits Happen shagger\n");

console.log(`Server started on port ${PORT}`);
for await (const req of s) {
  req.respond({ body });
}