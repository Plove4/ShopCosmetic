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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
using ShopCosmetic.AppDateFile;

namespace ShopCosmetic.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageProduct.xaml
    /// </summary>
    public partial class PageProduct : Page
    {
        public PageProduct()
        {
            InitializeComponent();

            ListProduct.ItemsSource = ConnectoOdb.conObj.Product.ToList();
        }



        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnSalehistory_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
