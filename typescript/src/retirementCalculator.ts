import * as readline from "readline";

export function isValidAnswer(answer: string) {
  if (answer.trim() === "") {
    return {
      isValid: false,
      error: "Input cannot be empty. Please try again.",
    };
  } else if (isNaN(parseInt(answer))) {
    return {
      isValid: false,
      error: "Input must be a number. Please try again.",
    };
  }
  return { isValid: true, error: "" }; // No error if valid
}

// Step 1: Input
function getInput(question: string): Promise<number> {
  return new Promise((resolve) => {
    const rl = readline.createInterface({
      input: process.stdin,
      output: process.stdout,
    });

    const askQuestion = () => {
      rl.question(question, (answer) => {
        const validation = isValidAnswer(answer);
        if (validation.isValid) {
          rl.close();
          resolve(parseInt(answer));
        } else {
          console.log(validation.error);
          askQuestion(); // Recursively ask the question again if validation fails
        }
      });
    };

    askQuestion(); // Initial question
  });
}

// Step 2: Concatenation
export function createResponse(
  currentAge: number,
  retirementAge: number,
): string {
  const yearsLeft = retirementAge - currentAge;
  const currentYear = new Date().getFullYear();
  const retireYear = currentYear + yearsLeft;
  return `You have ${yearsLeft} years left until you can retire.\nIt's ${currentYear}, so you can retire in ${retireYear}.`;
}

// Step 3: Output
function printResponse(message: string): void {
  console.log(message);
}

// Main function to run the program
async function main() {
  const currentAge = await getInput("What is your current age? ");
  const retirementAge = await getInput(
    "At what age would you like to retire? ",
  );
  const response = createResponse(currentAge, retirementAge); // Create greeting message
  printResponse(response); // Print greeting message
}

main();
