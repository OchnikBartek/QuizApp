using System.Windows;

namespace QuizApplication.Views
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void PlayQuiz_Click(object sender, RoutedEventArgs e)
        {
            QuizSolverView quizSolverView = new QuizSolverView();
            quizSolverView.ShowDialog();
        }

        private void CreateQuiz_Click(object sender, RoutedEventArgs e)
        {
            QuizGeneratorView quizGeneratorView = new QuizGeneratorView();
            quizGeneratorView.ShowDialog();
        }

        private void Leaderboard_Click(object sender, RoutedEventArgs e)
        {
            LeaderboardView leaderboardView = new LeaderboardView();
            leaderboardView.ShowDialog();
        }
    }
}
