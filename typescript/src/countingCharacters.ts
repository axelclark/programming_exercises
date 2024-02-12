import * as readline from "readline";

// Step 1: Input
function getInput(question: string): Promise<string> {
  return new Promise((resolve) => {
    const rl = readline.createInterface({
      input: process.stdin,
      output: process.stdout,
    });

    const askQuestion = () => {
      rl.question(question, (answer) => {
        if (answer.trim() === "") {
          // If input is an empty string, ask the question again
          console.log("Input cannot be empty. Please try again.");
          askQuestion(); // Recursively ask the question again
        } else {
          rl.close();
          resolve(answer);
        }
      });
    };

    askQuestion(); // Initial question
  });
}

// Step 2: Concatenation
export function createResponse(input: string): string {
  const num = input.length;
  return `${input} has ${num} characters.`;
}

// Step 3: Output
function printResponse(message: string): void {
  console.log(message);
}

// Main function to run the program
async function main() {
  const name = await getInput("What is the input string? "); // Get name from user
  const response = createResponse(name); // Create greeting message
  printResponse(response); // Print greeting message
}

main();
