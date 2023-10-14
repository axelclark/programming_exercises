// See https://aka.ms/new-console-template for more information
double one = PromptForDouble("What is the first number?");
double two = PromptForDouble("What is the second number?");

double sum = one + two;
double difference = one - two;
double product = one * two;
double quotient = one / two;

Console.WriteLine($@"
{one} + {two} = {sum}
{one} - {two} = {difference}
{one} * {two} = {product}
{one} / {two} = {quotient}
");

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