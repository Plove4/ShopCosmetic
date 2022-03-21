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
using ShopCosmetic.AppDateFile;

namespace ShopCosmetic.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageAddProduct.xaml
    /// </summary>
    public partial class PageAddProduct : Page
    {
        private Product curentProduct = new Product();
        public PageAddProduct(Product product)
        {
            InitializeComponent();
            curentProduct = product ?? new Product();
            CmbxOwner.ItemsSource = DBcontext.Context.Manufacturer.ToList();
            DataContext = curentProduct;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder builder = new StringBuilder();
            if (string.IsNullOrWhiteSpace(curentProduct.Title))
                builder.AppendLine("Укажите названеи продукта");
            if (string.IsNullOrWhiteSpace(curentProduct.Cost.ToString()))
                builder.AppendLine("Укажите цену продукта");
            if (curentProduct.Cost.ToString().StartsWith("-"))
                builder.AppendLine("Вы ввели отрицательную цену");
            if (curentProduct.Manufacturer == null)
                builder.AppendLine("Укажите производителя");
            if (string.IsNullOrWhiteSpace(curentProduct.Description))
                curentProduct.Description = "";
            if (string.IsNullOrWhiteSpace(curentProduct.MainImagePath))
                curentProduct.MainImagePath = "";

            if (builder.Length > 0)
            {
                MessageBox.Show(builder.ToString());
                return;
            }

            if (curentProduct.ID == 0)
            {
                DBcontext.Context.Product.Add(curentProduct);
            }

            try 
            {
                DBcontext.Context.SaveChanges();
                MessageBox.Show("Данные сохранены");
                FrameOdj.frameMain.Navigate(new PageProduct());
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
