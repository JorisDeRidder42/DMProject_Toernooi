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
    /// Interaction logic for ToernooiAanmakenWindow.xaml
    /// </summary>
    public partial class ToernooiAanmakenWindow : Window
    {
        public ToernooiAanmakenWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            cmbGameModeId.ItemsSource = DatabaseOperations.OphalengameModeIds();
        }

        private void btntBewaren_Click(object sender, RoutedEventArgs e)
        {
            string foutmelding = Valideer();

            if (string.IsNullOrWhiteSpace(foutmelding))
            {

                Toernooi toernooi = new Toernooi();
                toernooi.toernooiNaam = txttspelmodus.Text;
                toernooi.datum = DateTime.Parse(txttdatum.Text);
                toernooi.checkInuur = TimeSpan.Parse(txttcheckinuur.Text);
                toernooi.startuur = TimeSpan.Parse(txttstartuur.Text);
                toernooi.gameModeId = int.Parse(cmbGameModeId.Text);


                if (toernooi.IsGeldig())
                {
                    int ok = DatabaseOperations.ToevoegenToernooi(toernooi);
                    if (ok > 0)
                    {
                        Wissen();
                        MessageBox.Show($"Het toernooi is toegevoegd!\n", "Melding", MessageBoxButton.OK, MessageBoxImage.Information);
                        Close();
                    }
                    else
                    {
                        MessageBox.Show("Het toernooi is toegevoegd, er is iets fout!", "Foutmelding", MessageBoxButton.OK, MessageBoxImage.Error);

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

        private void btntAnnuleren_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Wissen()
        {
            txttspelmodus.Text = "";
            txttdatum.Text = "";
            txttcheckinuur.Text = "";
            txttstartuur.Text = "";
            cmbGameModeId.SelectedIndex = -1;
        }
        private string Valideer()
        {
            if (!DateTime.TryParse(txttdatum.Text, out var datumm))
            {
                return "deze datum is niet geldig!\n";
            }
            return "";
        }
    }
}
