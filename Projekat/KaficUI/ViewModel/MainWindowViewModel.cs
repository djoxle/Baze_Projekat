using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KaficUI.ViewModel
{
    public class MainWindowViewModel : BindableNotify
    {
        private BindableNotify currentViewModel;

        private CenovnikViewModel cenovnikViewModel = new CenovnikViewModel();
        private GostViewModel gostViewModel = new GostViewModel();

        public MyICommand<string> NavCommand { get; private set; }

        public MainWindowViewModel()
        {

            NavCommand = new MyICommand<string>(OnNav);
            currentViewModel = cenovnikViewModel;
        }

        public BindableNotify CurrentViewModel
        {
            get { return currentViewModel; }
            set
            {
                SetProperty(ref currentViewModel, value);
            }
        }

        private void OnNav(string destination)
        {
            switch (destination)
            {
                case "cenovnik":
                    CurrentViewModel = cenovnikViewModel;
                    break;
                case "gost":
                    CurrentViewModel = gostViewModel;
                    break;
            }
        }
    }
}
