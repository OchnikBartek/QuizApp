using System.Windows;

namespace QuizApplication.Views
{
    public partial class QuizSolverView : Window
    {
        private QuizSolverViewModel ViewModel => (QuizSolverViewModel)DataContext;
        private LeaderboardViewModel leaderboardViewModel = new LeaderboardViewModel();

        public QuizSolverView()
        {
            InitializeComponent();
            DataContext = new QuizSolverViewModel();
        }

        private void NextQuestion_Click(object sender, RoutedEventArgs e)
        {
            ViewModel.SubmitAnswer();

            if (ViewModel.CurrentIndex >= ViewModel.Questions.Count)
            {
                ViewModel.StopTimer();
                leaderboardViewModel.AddResult(ViewModel.PlayerName, ViewModel.GetElapsedTime(), ViewModel.Score);

                var summary = new SummaryWindow(ViewModel.PlayerName, ViewModel.Score, ViewModel.GetElapsedTime());
                summary.ShowDialog();
                this.Close();
            }
        }

        private void ReturnToMenu_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
