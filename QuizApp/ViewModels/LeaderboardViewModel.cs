using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Text.Json;
using System.Linq;

public class LeaderboardViewModel : INotifyPropertyChanged
{
    private const string LeaderboardFilePath = "leaderboard.json";

    public ObservableCollection<PlayerResult> PlayerResults { get; set; } = new ObservableCollection<PlayerResult>();

    public LeaderboardViewModel()
    {
        LoadResults();
    }

    public void AddResult(string playerName, TimeSpan time, int score)
    {
        PlayerResults.Add(new PlayerResult { PlayerName = playerName, TimeTaken = time, Score = score });
        PlayerResults = new ObservableCollection<PlayerResult>(
            PlayerResults.OrderByDescending(r => r.Score).ThenBy(r => r.TimeTaken));
        SaveResults();
        OnPropertyChanged(nameof(PlayerResults));
    }

    private void SaveResults()
    {
        var json = JsonSerializer.Serialize(PlayerResults);
        File.WriteAllText(LeaderboardFilePath, json);
    }

    private void LoadResults()
    {
        if (File.Exists(LeaderboardFilePath))
        {
            var json = File.ReadAllText(LeaderboardFilePath);
            var loadedResults = JsonSerializer.Deserialize<ObservableCollection<PlayerResult>>(json);
            if (loadedResults != null)
            {
                PlayerResults = new ObservableCollection<PlayerResult>(
                    loadedResults.OrderByDescending(r => r.Score).ThenBy(r => r.TimeTaken));
            }
        }
    }

    public void ClearResults()
    {
        PlayerResults.Clear();
        SaveResults();
        OnPropertyChanged(nameof(PlayerResults));
    }

    public event PropertyChangedEventHandler PropertyChanged;
    protected void OnPropertyChanged(string name) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}
