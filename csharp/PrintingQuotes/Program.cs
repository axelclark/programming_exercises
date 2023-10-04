// See https://aka.ms/new-console-template for more information
string quote = PromptForInput("What is the quote?");
string author = PromptForInput("Who said it?");

Console.WriteLine(author + " says, \"" + quote + "\"");

string PromptForInput(string prompt)
{
    Console.WriteLine(prompt);
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