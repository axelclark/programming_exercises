// sum.test.js
import { expect, test } from "vitest";
import { createResponse, isValidAnswer } from "./retirementCalculator";

test("returns isValid true", () => {
  expect(isValidAnswer("42")).toStrictEqual({ isValid: true, error: "" });
});

test("returns error if empty string", () => {
  expect(isValidAnswer("")).toStrictEqual({
    isValid: false,
    error: "Input cannot be empty. Please try again.",
  });
});

test("returns error if not a number", () => {
  expect(isValidAnswer("Not a number")).toStrictEqual({
    isValid: false,
    error: "Input must be a number. Please try again.",
  });
});

test("returns the correct response", () => {
  expect(createResponse(42, 60)).toBe(
    "You have 18 years left until you can retire.\nIt's 2024, so you can retire in 2042.",
  );
});
