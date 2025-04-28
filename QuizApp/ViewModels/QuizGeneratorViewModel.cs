using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Text.Json;

public class QuizGeneratorViewModel : INotifyPropertyChanged
{
    public string QuizName { get; set; }
    public ObservableCollection<Question> Questions { get; set; } = new ObservableCollection<Question>();
    public Question SelectedQuestion { get; set; }

    public void AddQuestion(string text)
    {
        var question = new Question { Text = text };
        question.Answers.Add(new Answer());
        question.Answers.Add(new Answer());
        question.Answers.Add(new Answer());
        question.Answers.Add(new Answer());
        Questions.Add(question);
    }

    public void RemoveSelectedQuestion()
    {
        if (SelectedQuestion != null)
            Questions.Remove(SelectedQuestion);
    }

    public void SaveQuiz(string filePath)
    {
        var quiz = new Quiz { Name = QuizName, Questions = new List<Question>(Questions) };
        var json = JsonSerializer.Serialize(quiz);
        var encrypted = CryptoHelper.Encrypt(json);
        File.WriteAllBytes(filePath, encrypted);
    }

    public void LoadQuiz(string filePath)
    {
        var encrypted = File.ReadAllBytes(filePath);
        var json = CryptoHelper.Decrypt(encrypted);
        var quiz = JsonSerializer.Deserialize<Quiz>(json);
        QuizName = quiz.Name;
        Questions.Clear();
        foreach (var q in quiz.Questions)
            Questions.Add(q);
    }

    public event PropertyChangedEventHandler PropertyChanged;
    protected void OnPropertyChanged(string name) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}
