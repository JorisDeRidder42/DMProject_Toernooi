#pragma checksum "..\..\DatabaseWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "19F6A2FC8A135D4B941C50DE219F4FA6F768D06614AFF3BDBB9649559C859140"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using DeRidderJoris_GRPLTId1._1_DM_Project;
using MaterialDesignThemes.Wpf;
using MaterialDesignThemes.Wpf.Converters;
using MaterialDesignThemes.Wpf.Transitions;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace DeRidderJoris_GRPLTId1._1_DM_Project {
    
    
    /// <summary>
    /// DatabaseWindow
    /// </summary>
    public partial class DatabaseWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 38 "..\..\DatabaseWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid dataToernooi;
        
        #line default
        #line hidden
        
        
        #line 50 "..\..\DatabaseWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnVerwijderen;
        
        #line default
        #line hidden
        
        
        #line 51 "..\..\DatabaseWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnInschrijvingAanpassen;
        
        #line default
        #line hidden
        
        
        #line 52 "..\..\DatabaseWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnInschrijven;
        
        #line default
        #line hidden
        
        
        #line 53 "..\..\DatabaseWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnAnnuleren;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/DeRidderJoris_GRPLTId1.1_DM_Project;component/databasewindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\DatabaseWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 15 "..\..\DatabaseWindow.xaml"
            ((DeRidderJoris_GRPLTId1._1_DM_Project.DatabaseWindow)(target)).Loaded += new System.Windows.RoutedEventHandler(this.Window_Loaded);
            
            #line default
            #line hidden
            return;
            case 2:
            
            #line 19 "..\..\DatabaseWindow.xaml"
            ((System.Windows.Input.CommandBinding)(target)).Executed += new System.Windows.Input.ExecutedRoutedEventHandler(this.btnAnnuleren_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.dataToernooi = ((System.Windows.Controls.DataGrid)(target));
            
            #line 38 "..\..\DatabaseWindow.xaml"
            this.dataToernooi.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.dataToernooi_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.btnVerwijderen = ((System.Windows.Controls.Button)(target));
            return;
            case 5:
            this.btnInschrijvingAanpassen = ((System.Windows.Controls.Button)(target));
            return;
            case 6:
            this.btnInschrijven = ((System.Windows.Controls.Button)(target));
            
            #line 52 "..\..\DatabaseWindow.xaml"
            this.btnInschrijven.Click += new System.Windows.RoutedEventHandler(this.btnToevoegen_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.btnAnnuleren = ((System.Windows.Controls.Button)(target));
            
            #line 53 "..\..\DatabaseWindow.xaml"
            this.btnAnnuleren.Click += new System.Windows.RoutedEventHandler(this.btnAnnuleren_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

