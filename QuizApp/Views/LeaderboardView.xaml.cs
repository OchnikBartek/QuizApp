using System.Windows;

namespace QuizApplication.Views
{
    public partial class LeaderboardView : Window
    {
        private LeaderboardViewModel ViewModel => (LeaderboardViewModel)DataContext;

        public LeaderboardView()
        {
            InitializeComponent();
            DataContext = new LeaderboardViewModel();
        }

        private void ClearLeaderboard_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Czy na pewno chcesz wyczyścić tablicę wyników?", "Potwierdzenie", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                ViewModel.ClearResults();
            }
        }

        private void ReturnToMenu_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
