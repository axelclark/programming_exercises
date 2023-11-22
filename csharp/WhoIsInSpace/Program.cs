// See https://aka.ms/new-console-template for more information
/*
using System.Net;
using System.Text.Json;

HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://api.open-notify.org/astros.json");

HttpWebResponse response = myReq.GetResponse();
Stream receiveStream = response.GetResponseStream();
StreamReader readStream = new StreamReader(receiveStream, Encoding.UTF8);

Console.WriteLine(readStream.ReadToEnd());
*/

using System.Net.Http;
using System.Threading.Tasks;
using System.Text.Json;

HttpClient client = new HttpClient();

HttpResponseMessage response = await client.GetAsync("http://api.open-notify.org/astros.json");

string responseString = await response.Content.ReadAsStringAsync();

Console.WriteLine(responseString);

AstroResponse astroResponse = JsonSerializer.Deserialize<AstroResponse>(responseString);

Console.WriteLine($"Number of astronauts in space: {astroResponse.number}");

foreach (var astronaut in astroResponse.people)
{
    Console.WriteLine($"Name: {astronaut.name}, Craft: {astronaut.craft}");
}

public class AstroResponse
{
    public int number { get; set; }
    public List<Astronaut> people { get; set; }
    public string message { get; set; }
}

public class Astronaut
{
    public string name { get; set; }
    public string craft { get; set; }
}