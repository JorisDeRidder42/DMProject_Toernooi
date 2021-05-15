using DeRidderJoris_GRPLTId1._1_DM_DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DeRidderJoris_GRPLTId1._1_DM_Project
{
    /// <summary>
    /// Interaction logic for DatabaseWindow.xaml
    /// </summary>
    public partial class DatabaseWindow : Window
    {
        public DatabaseWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            dataToernooi.ItemsSource = DatabaseOperations.OphalenGekozenSpel();
        }

        private void btnAnnuleren_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void dataToernooi_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Toernooi GeselecteerdeWedstrijd = dataToernooi.SelectedItem as Toernooi;

            Helper.IdGame = GeselecteerdeWedstrijd.toernooiID;

            InschrijvenWindow inschrijven = new InschrijvenWindow();
            inschrijven.Show();
        }

        private void btnToevoegen_Click(object sender, RoutedEventArgs e)
        {
            InschrijvenWindow inschrijven = new InschrijvenWindow();
            inschrijven.Show();
        }

        private string Valideer(string columnName)
        {
            if (columnName == "Toernooi" && dataToernooi.SelectedItem == null)
            {
                return "selecteer een Toernooi om te verwijderen!\n";
            }
            return "";
        }

        private void btnVerwijderen_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
