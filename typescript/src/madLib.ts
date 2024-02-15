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

// Main function to run the program
async function main() {
  const noun = await getInput("Enter a noun: ");
  const verb = await getInput("Enter a verb: ");
  const adjective = await getInput("Enter an adjective: ");
  const adverb = await getInput("Enter an adverb: ");
  const response = `Do you ${verb} your ${adjective} ${noun} ${adverb}? That's hilarious!`;
  console.log(response);
}

main();
