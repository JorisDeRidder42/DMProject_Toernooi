   M S B A M L   `   `   `  ����^  ZDeRidderJoris_GRPLTId1.1_DM_Project, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null[2clr-namespace:DeRidderJoris_GRPLTId1._1_DM_Project$DeRidderJoris_GRPLTId1._1_DM_Project  5   	   9    3DeRidderJoris_GRPLTId1._1_DM_Project.DatabaseWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Dlocal2clr-namespace:DeRidderJoris_GRPLTId1._1_DM_Project     5   	   b ^MaterialDesignThemes.Wpf, Version=4.0.0.2422, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   -   5           MaterialDesignBody#���   5	   	   $��Regular"�5
   	   $��13(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignFont#���  5   	    � Title$ DatabaseWindow��5      $	��650��6   $	��800��6,    J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command$ ApplicationCommands.Close��5      5      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      �� 5      �� 5      �� 5      $
��auto �6   �� 5      $
��auto �6    � ColumnDefinitions 5   
   �� 5      $	��53* �6   �� 5       $
��145* �6   �� 5!      $
��198* �6   �� 5"      $
��198* �6   �� 5#      $
��198* �6   .+�5&   
   �� -   5         ��Name$ lblTitle��5&      $6��0Kies in welk toernooi u wilt worden ingeschreven��6"   $��	Open Sans)�6]   $��20(�6t   $��Center=�6�   $
��Bold"�6�   $��5��6�   $��0��6�   $��0��6�   $��10,18q�6�   �� 5(   
   -   5         ��Name$ btnTAfsluiten��5*   S    & "MaterialDesignFloatingActionButton#��[ 5)   	   $��4��6E   $��0��6U   $	��Top=�6b   $��Right=�6z   $��	0,10,10,0q�6�   	 � ToolTip$.	 (MaterialDesignFloatingActionAccentButton��5*   	   $��50��6<   $��50��6G   .��5+      '  !MaterialDesignThemes.Wpf.PackIcon  
   Kind$
 House=�6&   $��30��63   $��30��6?   5,      &   System.Windows.Controls.DataGrid  5.   
   -   5          Name$ dataToernooi��5.         AutoGenerateColumns .  $��5q�6v   $��1��5/   
   $��0��6   $��5��6(   $��3��6<      
IsReadOnly .    Columns 50      0  *System.Windows.Controls.DataGridTextColumn  52      ,  &System.Windows.Controls.DataGridColumn   Header$ 	Spelmodus��6F   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *toernooiNaam+6F     53      $ Datum��6X    6%   �� *datum+ �� StringFormat$ 
dd/MM/yyyy��6X     54      $ Check in uur��6Y    6%   �� *
checkInuur+$ hh\:mm��6Y     55      $ 	Start uur��6W    6%   �� *
startuur+$ hh\:mm��6W   57      �� 59   
   -   5         ��Name$ txtSpelmodus��59      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ 	Spelmodus��6)   $��4��6T   $��0��6a   $��5q�6q   $��2��6|   �� 5:   
   -   5        $ txtdata��5:      $ Datum��6$   $��4��6K   $��2��6X   $��5q�6h   �� 5;   
   -   5        $ txtcheckuur��5;      $ Check in Uur��6'   $��4��6U   $��3��6b   $��5q�6r   �� 5<   
   -	   5        $ txtstartuur��5<      $ 	Start uur��6'   $��4��6R   $��4��6_   $��5q�6o   �� 5>   
   -
   5        $ btnVerwijderen��5>      $��Toernooi Verwijderen��6)   $��5��6H   $��0��6U   $��5q�6e    $  MaterialDesignRaisedAccentButton#��[ 6p   $��2��6�   �� 5?   
   -   5        $ btnAanpassen��5?      $��Toernooi Aanpassen��6'   $��5��6D   $��2��6Q   $��5q�6a   #��[ 6l   6�   �� 5@   
   -   5        $ btnToevoegen��5@      $��Toernooi Toevoegen��6'   $��5��6D   $��3��6Q   $��5q�6a   #��[ 6l   6�   �� 5A   
   -   5        $ btnInschrijven��5A      $��Inschrijven��6)   $��5��6?   $��4��6L   $��5q�6\   6g   5B      5C      