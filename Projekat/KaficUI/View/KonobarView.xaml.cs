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

namespace KaficUI.View
{
    /// <summary>
    /// Interaction logic for KonobarView.xaml
    /// </summary>
    public partial class KonobarView : UserControl
    {
        public KonobarView()
        {
            InitializeComponent();
        }
        private void DeleteCommandHandler(object sender, ExecutedRoutedEventArgs e) { }
        private void AddCommandHandler(object sender, ExecutedRoutedEventArgs e) { }
        private void UpdateCommandHandler(object sender, ExecutedRoutedEventArgs e) { }
    }
}
