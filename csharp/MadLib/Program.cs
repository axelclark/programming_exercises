// See https://aka.ms/new-console-template for more information

string noun = PromptForInput("Enter a noun: ");
string verb = PromptForInput("Enter a verb: ");
string adjective = PromptForInput("Enter a adjective: ");
string adverb = PromptForInput("Enter a adverb: ");

Console.WriteLine($"Do you {verb} your {adjective} {noun} {adverb}? That's hilarious!");

string PromptForInput(string prompt)
{
    Console.Write(prompt);
    string inputString = Console.ReadLine();
    
    if(inputString.Length > 0)
    {
        return inputString;
    }   
    else
    {
        Console.WriteLine($"The input string requires at least one character.");
        return PromptForInput(prompt);
    }
}