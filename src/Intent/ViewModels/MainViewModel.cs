// --------------------------------------------------------------------------------------------------------------------
// <copyright file="MainViewModel.cs" company="Watson Laboratory">
//   Copyright © 2020 Watson Laboratory
// </copyright>
// --------------------------------------------------------------------------------------------------------------------

using System;
using Caliburn.Micro;
using Dapplo.Microsoft.Extensions.Hosting.CaliburnMicro;
using Intent.Exceptions;
using Intent.Models;

namespace Intent.ViewModels
{
    /// <summary>
    /// A simple main view model
    /// </summary>
    public class MainViewModel : Screen, ICaliburnMicroShell
    {
        //private readonly IServiceProvider serviceProvider;
        //private readonly IWindowManager windowManager;
        //private readonly IWpfContext wpfContext;

        //public MainViewModel(IWpfContext wpfContext, IServiceProvider serviceProvider, IWindowManager windowManager, IIntentionRepository intentionRepository)
        //{
        //    this.wpfContext = wpfContext;
        //    this.serviceProvider = serviceProvider;
        //    this.windowManager = windowManager;
        //    this.intentionRepository = intentionRepository;
        //}

        private readonly IIntentionRepository intentionRepository;

        public MainViewModel(IIntentionRepository intentionRepository)
        {
            this.intentionRepository = intentionRepository;
        }

        /// <summary>
        /// Gets a list of the user's intentions.
        /// </summary>
        public BindableCollection<IIntentionViewModel> Intentions { get; } = new BindableCollection<IIntentionViewModel>();

        /// <summary>
        /// Adds a new intention to the intention repository and updates the view.
        /// </summary>
        public void Add()
        {
            // Add new intention
            var intention = new IntentionViewModel();

            try
            {
                this.intentionRepository.TryAddIntention(intention.Value);
            }
            catch (DataAccessException e)
            {
                Console.WriteLine(e);
                throw;
            }

            this.Intentions.Add(intention);
        }

        //public void Exit()
        //{
        //    this.wpfContext.WpfApplication.Shutdown();
        //}
    }
}