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
            GameMode opgehaaldeGameMode = DatabaseOperations.OphalenGekozenSpel();
            dataToernooi.ItemsSource = opgehaaldeGameMode.Toernooien;
            lblTitle.Content = "Het gekozen spel is " + opgehaaldeGameMode.gameModeNaam;
        }

        private void btnVerwijderen_Click(object sender, RoutedEventArgs e)
        {
            string foutmelding = ValideerVerwijderen("Toernooi");

            if (string.IsNullOrWhiteSpace(foutmelding))
            {

                Toernooi toernooi = dataToernooi.SelectedItem as Toernooi;

                int ok = DatabaseOperations.VerwijderenToernooi(toernooi);

                if (ok > 0)
                {
                    dataToernooi.ItemsSource = DatabaseOperations.OphalenToernooienViaToernooiId();
                    Wissen();
                    MessageBox.Show("Het toernooi is verwijderd!", "Melding", MessageBoxButton.OK, MessageBoxImage.Information) ;
                }
                else
                {
                    MessageBox.Show("Toernooi is niet verwijderd!","Foutmelding", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show(foutmelding);
            }
        }
        private void btnAanpassen_Click(object sender, RoutedEventArgs e)
        {
            string foutmelding = Valideer("Toernooi");
            if (string.IsNullOrWhiteSpace(foutmelding))
            {
                Toernooi toernooi = dataToernooi.SelectedItem as Toernooi;

                toernooi.toernooiNaam = txtSpelmodus.Text;
                toernooi.datum = DateTime.Parse(txtdata.Text);
                toernooi.checkInuur = TimeSpan.Parse(txtcheckuur.Text);
                toernooi.startuur = TimeSpan.Parse(txtstartuur.Text);

                if (toernooi.IsGeldig())
                {
                    int ok = DatabaseOperations.AanpassenToernooi(toernooi);
                    if (ok > 0)
                    {
                        dataToernooi.ItemsSource = DatabaseOperations.OphalenToernooienViaToernooiId();
                        Wissen();
                        MessageBox.Show("Toernooi is aangepast", "Melding", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    else
                    {
                        MessageBox.Show("Toernooi is niet aangepast!", "Foutmelding", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
                else
                {
                    MessageBox.Show(toernooi.Error);
                }

            }
            else
            {
                MessageBox.Show(foutmelding);
            }
        }
        private void btnToevoegen_Click(object sender, RoutedEventArgs e)
        {
            ToernooiAanmakenWindow toernooiAanmakenWindow = new ToernooiAanmakenWindow();
            toernooiAanmakenWindow.Show();
        }

        private void dataToernooi_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
         
            if (dataToernooi.SelectedItem != null)
            {
                Toernooi geselecteerdeWedstrijd = dataToernooi.SelectedItem as Toernooi;
                Helper.IdToernooi = geselecteerdeWedstrijd.toernooiId;

                Helper.IdGameMode = geselecteerdeWedstrijd.gameModeId;

                if (dataToernooi.SelectedItem is Toernooi toernooi)
                {
                    txtSpelmodus.Text = toernooi.toernooiNaam;
                    txtdata.Text = toernooi.datum.ToString("dd/MM/yyyy");
                    txtcheckuur.Text = toernooi.checkInuur.ToString("hh\\:mm");
                    txtstartuur.Text = toernooi.startuur.ToString("hh\\:mm");
                }
            }
        }

        private void btnInschrijven_Click(object sender, RoutedEventArgs e)
        {
            Toernooi GeselecteerdeWedstrijd = dataToernooi.SelectedItem as Toernooi;

            if (GeselecteerdeWedstrijd != null)
            {
                InschrijvenWindow inschrijven = new InschrijvenWindow();
                inschrijven.Show();
            }
            else
            {
                MessageBox.Show("Gelieve een toernooi te selecteren!", "Foutmelding", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnAnnuleren_Click(object sender, RoutedEventArgs e)
        {
            Wissen();
            Close();
        }

        private void Wissen()
        {
            txtSpelmodus.Text = "";
            txtdata.Text = "";
            txtcheckuur.Text = "";
            txtstartuur.Text = "";
        }

        private string ValideerVerwijderen(string columnName)
        {
            if (columnName == "Toernooi" && dataToernooi.SelectedItem == null)
            {
                return "selecteer een Toernooi om te verwijderen!\n";
            }
            return "";
        }
        private string Valideer(string columnName)
        {
            if (columnName == "Toernooi" && dataToernooi.SelectedItem == null)
            {
                return "selecteer een Toernooi om aan te passen!\n";
            }
            if (!DateTime.TryParse(txtdata.Text, out var datumm))
            {
                return "deze datum is niet geldig!\n";
            }
            return "";
        }

        private void btnTAfsluiten_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
