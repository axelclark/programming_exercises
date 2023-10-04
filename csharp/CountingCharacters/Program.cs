// See https://aka.ms/new-console-template for more information

string inputString = PromptForInput();

Console.WriteLine($"{inputString} has {inputString.Length} characters.");

string PromptForInput()
{
    Console.WriteLine("What is the input string?");
    string inputString = Console.ReadLine();
    
    if(inputString.Length > 0)
    {
        return inputString;
    }   
    else
    {
        Console.WriteLine($"The input string requires at least one character.");
        return PromptForInput();
    }
}