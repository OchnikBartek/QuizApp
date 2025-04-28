using System.Windows;

namespace QuizApplication.Views
{
    public partial class QuizGeneratorView : Window
    {
        private QuizGeneratorViewModel ViewModel => (QuizGeneratorViewModel)DataContext;

        public QuizGeneratorView()
        {
            InitializeComponent();
            DataContext = new QuizGeneratorViewModel();
        }

        private void AddQuestion_Click(object sender, RoutedEventArgs e)
        {
            ViewModel.AddQuestion("Nowe pytanie");
        }

        private void RemoveQuestion_Click(object sender, RoutedEventArgs e)
        {
            ViewModel.RemoveSelectedQuestion();
        }

        private void SaveQuiz_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new Microsoft.Win32.SaveFileDialog();
            if (dialog.ShowDialog() == true)
            {
                ViewModel.SaveQuiz(dialog.FileName);
            }
        }

        private void LoadQuiz_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new Microsoft.Win32.OpenFileDialog();
            if (dialog.ShowDialog() == true)
            {
                ViewModel.LoadQuiz(dialog.FileName);
            }
        }

        private void ReturnToMenu_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
