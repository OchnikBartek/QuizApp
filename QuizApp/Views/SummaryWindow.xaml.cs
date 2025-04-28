using System.Windows;

namespace QuizApplication.Views
{
    public partial class SummaryWindow : Window
    {
        public SummaryWindow(string playerName, int score, TimeSpan timeTaken)
        {
            InitializeComponent();
            SummaryText.Text = $"Gratulacje {playerName}!\n\nZdobyte punkty: {score}\nCzas: {timeTaken.Minutes}m {timeTaken.Seconds}s";
        }

        private void ReturnToMenu_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
