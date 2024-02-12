import * as readline from "readline";

// Step 1: Input
function getInput(question: string): Promise<string> {
  return new Promise((resolve) => {
    const rl = readline.createInterface({
      input: process.stdin,
      output: process.stdout,
    });

    rl.question(question, (answer) => {
      rl.close();
      resolve(answer);
    });
  });
}

// Step 2: Concatenation
export function createGreeting(name: string): string {
  return `Hello, ${name}!`;
}

// Step 3: Output
function printGreeting(message: string): void {
  console.log(message);
}

// Main function to run the program
async function main() {
  const name = await getInput("What is your name? "); // Get name from user
  const greeting = createGreeting(name); // Create greeting message
  printGreeting(greeting); // Print greeting message
}

main();
