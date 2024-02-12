// sum.test.js
import { expect, test } from "vitest";
import { createResponse } from "./countingCharacters";

test("returns the number of characters", () => {
  expect(createResponse("Axel")).toBe("Axel has 4 characters.");
});
