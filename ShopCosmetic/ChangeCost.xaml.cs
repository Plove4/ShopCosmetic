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
using ShopCosmetic.AppDateFile;
using ShopCosmetic.Pages;

namespace ShopCosmetic
{
    /// <summary>
    /// Логика взаимодействия для ChangeCost.xaml
    /// </summary>
    public partial class ChangeCost : Window
    {
        private decimal averagecost;
        private List<Product> productcost;

        public ChangeCost(List<Product> products)
        {
            InitializeComponent();
            productcost = products;
            foreach (var item in productcost)
            {
                averagecost += item.Cost;
            }
            Editname.Text = averagecost.ToString();
        }

        private void SvButn_Click(object sender, RoutedEventArgs e)
        {
            decimal tempcost;
            if(decimal.TryParse(Editname.Text, out tempcost))
            {
                foreach (var item in productcost)
                {
                    item.Cost += tempcost;
                }

                try
                {
                    DBcontext.Context.SaveChanges();
                    DBcontext.Context.ChangeTracker.Entries().ToList().ForEach(c => c.Reload());
                    MessageBox.Show($"Стоимость увеличина на {tempcost}","Изменение стоимости",MessageBoxButton.OK,MessageBoxImage.Information);
                    DialogResult = true;
                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"При изменении мин. стоимость возникла ошибка:\n{ex.Message}",
                        "Изменение стоимость", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
                MessageBox.Show("В поле для ввода должно быть число",
                   "Изменение стоимость", MessageBoxButton.OK, MessageBoxImage.Error);
        }

        private void CancleButn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
