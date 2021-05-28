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
using DeRidderJoris_GRPLTId1._1_DM_DAL;

namespace DeRidderJoris_GRPLTId1._1_DM_Project
{
    /// <summary>
    /// Interaction logic for SpelerWindow.xaml
    /// </summary>
    public partial class SpelerWindow : Window
    {
        public SpelerWindow()
        {
            InitializeComponent();
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            List<Speler> opgehaaldeSpeler = DatabaseOperations.OphalenSpelerViaSpelerId();
            dataSpeler.ItemsSource = opgehaaldeSpeler;
        }

        private void dataSpeler_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dataSpeler.SelectedItem != null)
            {
                Speler geselecteerdeSpeler = dataSpeler.SelectedItem as Speler;

                Helper.IdSpeler = geselecteerdeSpeler.spelerId;

                if (dataSpeler.SelectedItem is Speler speler)
                {
                    txtvoornaam.Text = speler.voornaam;
                    txtachternaam.Text = speler.achternaam;
                    txtnicknaam.Text = speler.nicknaam;
                    txtemail.Text = speler.email;
                }
            }
        }
        //speler uitschrijven
        private void btnSVerwijderen_Click(object sender, RoutedEventArgs e)
        {
            string foutmelding = ValideerVerwijderen("Speler");

            if (string.IsNullOrWhiteSpace(foutmelding))
            {

                Speler speler = dataSpeler.SelectedItem as Speler;

                int ok = DatabaseOperations.VerwijderenSpeler(speler);

                if (ok > 0)
                {
                    dataSpeler.ItemsSource = DatabaseOperations.OphalenSpelerViaSpelerId();
                    MessageBox.Show("De speler is verwijderd", "Melding", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {
                    MessageBox.Show("Speler is niet verwijderd!", "Foutmelding", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show(foutmelding);
            }
        }
        //speler aanpassen
        private void btnSAanpassen_Click(object sender, RoutedEventArgs e)
        {
            string foutmelding = Valideer("Speler");
            if (string.IsNullOrWhiteSpace(foutmelding))
            {
                Speler speler = dataSpeler.SelectedItem as Speler;

                speler.voornaam = txtvoornaam.Text;
                speler.achternaam = txtachternaam.Text;
                speler.nicknaam = txtnicknaam.Text;
                speler.email = txtemail.Text;
               
                if (speler.IsGeldig())
                {
                    int ok = DatabaseOperations.AanpassenSpeler(speler);
                    if (ok > 0)
                    {
                        dataSpeler.ItemsSource = DatabaseOperations.OphalenSpelerViaSpelerId();
                        Wissen();
                        MessageBox.Show("Speler is aangepast", "Melding", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    else
                    {
                        MessageBox.Show("Speler is niet aangepast!", "Foutmelding", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
                else
                {
                    MessageBox.Show(speler.Error);
                }

            }
            else
            {
                MessageBox.Show(foutmelding);
            }
        }

        private void btnSAnnuleren_Click(object sender, RoutedEventArgs e)
        {
            Wissen();
            this.Close();
        }


        private void Wissen()
        {
            txtvoornaam.Text = "";
            txtachternaam.Text = "";
            txtnicknaam.Text = "";
            txtemail.Text = "";
        }

        private string Valideer(string columnName)
        {
            if (columnName == "Speler" && dataSpeler.SelectedItem == null)
            {
                return "selecteer een Speler om aan te passen\n";
            }
            return "";
        }
        private string ValideerVerwijderen(string columnName)
        {
            if (columnName == "Speler" && dataSpeler.SelectedItem == null)
            {
                return "selecteer een Speler om te verwijderen\n";
            }
            return "";
        }
    }
}
