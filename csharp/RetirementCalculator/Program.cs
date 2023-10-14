// See https://aka.ms/new-console-template for more information
// See https://aka.ms/new-console-template for more information
double currentAge = PromptForDouble("What is your current age?");
double desiredRetirementAge = PromptForDouble("At what age would you like to retire?");
double yearsUntilRetirement = desiredRetirementAge - currentAge;
double currentYear = DateTime.Now.Year;
double retirementYear = currentYear + yearsUntilRetirement;

if (yearsUntilRetirement > 0)
{
    Console.WriteLine($"You have {yearsUntilRetirement} years left until you can retire.");
    Console.WriteLine($"It's {currentYear}, so you can retire in 2055.");
}
else
{
    Console.WriteLine("You can already retire!");
}

double PromptForDouble(string prompt)
{
    double? input = null;
    while (!input.HasValue)
    {
        Console.WriteLine(prompt);
        string inputString = Console.ReadLine();
        try
        {
            input = double.Parse(inputString);
            if (input < 0)
            {
                Console.WriteLine("Please provide a positive number.");
                input = null;
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Please provide a valid number.");
            input = null;
        }
    }

    return input.Value;
}
