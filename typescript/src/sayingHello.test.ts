// sum.test.js
import { expect, test } from "vitest";
import { createGreeting } from "./sayingHello";

test("creates a greeting from a name", () => {
  expect(createGreeting("Axel")).toBe("Hello, Axel!");
});
