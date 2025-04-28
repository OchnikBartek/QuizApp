using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Text.Json;

public class QuizSolverViewModel : INotifyPropertyChanged
{
    public ObservableCollection<Question> Questions { get; set; } = new ObservableCollection<Question>();
    private int _currentIndex;
    public int CurrentIndex
    {
        get => _currentIndex;
        set { _currentIndex = value; OnPropertyChanged(nameof(CurrentQuestion)); }
    }

    public Question CurrentQuestion => (Questions.Count > 0 && CurrentIndex >= 0 && CurrentIndex < Questions.Count) ? Questions[CurrentIndex] : null;

    private Stopwatch stopwatch = new Stopwatch();
    public int Score { get; private set; }
    public string PlayerName { get; set; }

    public void LoadQuiz(string path)
    {
        var encrypted = File.ReadAllBytes(path);
        var json = CryptoHelper.Decrypt(encrypted);
        var quiz = JsonSerializer.Deserialize<Quiz>(json);

        Questions.Clear();
        foreach (var q in quiz.Questions)
            Questions.Add(q);
    }

    public void StartQuiz()
    {
        CurrentIndex = 0;
        Score = 0;
        stopwatch.Restart();
    }

    public void SubmitAnswer()
    {
        if (CurrentQuestion != null && CurrentQuestion.Answers.All(a => !string.IsNullOrEmpty(a.Text)))
        {
            if (CurrentQuestion.Answers.All(a => a.IsCorrect == a.UserSelected))
            {
                Score++;
            }
            CurrentIndex++;
            if (CurrentIndex >= Questions.Count)
                stopwatch.Stop();
        }
    }

    public void StopTimer() => stopwatch.Stop();
    public TimeSpan GetElapsedTime() => stopwatch.Elapsed;

    public event PropertyChangedEventHandler PropertyChanged;
    protected void OnPropertyChanged(string name) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}
