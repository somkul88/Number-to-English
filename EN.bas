Attribute VB_Name = "EN"
Option Explicit
'Main Function
Function entext(ByVal MyNumber)
    Dim Dollars, Cents, Temp, Chk1
    Dim DecimalPlace, Count, Test1
    ReDim Place(9) As String
    Place(2) = "THOUSAND "
    Place(3) = "MILLION "
    Place(4) = "BILLION "
    Place(5) = "TRILLION "
    Chk1 = "0"
    ' String representation of amount.
    MyNumber = WorksheetFunction.Round(MyNumber, 2)
    MyNumber = Trim(Str(MyNumber))
    ' Position of decimal place 0 if none.
    DecimalPlace = InStr(MyNumber, ".")
    ' Convert cents and set MyNumber to dollar amount.
     Test1 = Left(Mid(MyNumber, DecimalPlace + 1) & "00", 2)
    If DecimalPlace > 0 Then
        Cents = GetTens(Test1)
        MyNumber = Trim(Left(MyNumber, DecimalPlace - 1))
    End If
    Count = 1
    Do While MyNumber <> ""
        Temp = GetHundreds(Right(MyNumber, 3))
        If Temp <> "" Then Dollars = Temp & Place(Count) & Dollars
        If Len(MyNumber) > 3 Then
            MyNumber = Left(MyNumber, Len(MyNumber) - 3)
        Else
            MyNumber = ""
        End If
        Count = Count + 1
    Loop
    Select Case Dollars
        Case ""
            Dollars = "NO BAHT"
            Chk1 = "1"
        Case "ONE"
            Dollars = "ONE BAHT"
         Case Else
            Dollars = Dollars & "BAHT"
    End Select
    Select Case Cents
        Case ""
            Cents = " ONLY"
            If Chk1 = "1" Then
            Chk1 = "1"
            Else
            Chk1 = "0"
            End If
        Case "ONE"
            Cents = " AND ONE SATANG"
              Case Else
            Cents = " AND " & Cents & "SATANG"
    End Select
    If Chk1 = "1" Then
    entext = ""
    Else
    entext = "----" & Dollars & Cents & "----"
    End If
End Function

Function entext1(ByVal MyNumber)
    Dim Dollars, Cents, Temp, Chk1
    Dim DecimalPlace, Count, Test1
    ReDim Place(9) As String
    Place(2) = "THOUSAND "
    Place(3) = "MILLION "
    Place(4) = "BILLION "
    Place(5) = "TRILLION "
    Chk1 = "0"
    ' String representation of amount.
    MyNumber = WorksheetFunction.Round(MyNumber, 2)
    MyNumber = Trim(Str(MyNumber))
    ' Position of decimal place 0 if none.
    DecimalPlace = InStr(MyNumber, ".")
    ' Convert cents and set MyNumber to dollar amount.
     Test1 = Left(Mid(MyNumber, DecimalPlace + 1) & "00", 2)
    If DecimalPlace > 0 Then
        Cents = GetTens(Test1)
        MyNumber = Trim(Left(MyNumber, DecimalPlace - 1))
    End If
    Count = 1
    Do While MyNumber <> ""
        Temp = GetHundreds(Right(MyNumber, 3))
        If Temp <> "" Then Dollars = Temp & Place(Count) & Dollars
        If Len(MyNumber) > 3 Then
            MyNumber = Left(MyNumber, Len(MyNumber) - 3)
        Else
            MyNumber = ""
        End If
        Count = Count + 1
    Loop
    Select Case Dollars
        Case ""
            Dollars = ""
            Chk1 = "1"
        Case "ONE"
            Dollars = "ONE"
         Case Else
            Dollars = Dollars & ""
    End Select
    Select Case Cents
        Case ""
            Cents = "ONLY"
            If Chk1 = "1" Then
            Chk1 = "1"
            Else
            Chk1 = "0"
            End If
        Case "ONE"
            Cents = "AND CENTS ONE"
              Case Else
            Cents = "AND " & "CENTS " & Cents
    End Select
    If Chk1 = "1" Then
    entext1 = ""
    Else
    entext1 = "US  $  ----" & Dollars & Cents & "----"
    End If
End Function

Function entext2(ByVal MyNumber)
    Dim Dollars, Cents, Temp, Chk1
    Dim DecimalPlace, Count, Test1
    ReDim Place(9) As String
    Place(2) = "THOUSAND "
    Place(3) = "MILLION "
    Place(4) = "BILLION "
    Place(5) = "TRILLION "
    Chk1 = "0"
    ' String representation of amount.
    MyNumber = WorksheetFunction.Round(MyNumber, 2)
    MyNumber = Trim(Str(MyNumber))
    ' Position of decimal place 0 if none.
    DecimalPlace = InStr(MyNumber, ".")
    ' Convert cents and set MyNumber to dollar amount.
     Test1 = Left(Mid(MyNumber, DecimalPlace + 1) & "00", 2)
    If DecimalPlace > 0 Then
        Cents = Test1
        MyNumber = Trim(Left(MyNumber, DecimalPlace - 1))
    End If
    Count = 1
    Do While MyNumber <> ""
        Temp = GetHundreds(Right(MyNumber, 3))
        If Temp <> "" Then Dollars = Temp & Place(Count) & Dollars
        If Len(MyNumber) > 3 Then
            MyNumber = Left(MyNumber, Len(MyNumber) - 3)
        Else
            MyNumber = ""
        End If
        Count = Count + 1
    Loop
    Select Case Dollars
        Case ""
            Dollars = "NO BAHTS"
            Chk1 = "1"
        Case "ONE"
            Dollars = "ONE ONLY"
         Case Else
            Dollars = Dollars & ""
    End Select
    Select Case Cents
        Case ""
            Cents = "ONLY"
            If Chk1 = "1" Then
            Chk1 = "1"
            Else
            Chk1 = "0"
            End If
        Case "ONE"
            Cents = "AND ONE "
        Case Else
            Cents = "AND " & Cents & "/100"
    End Select
    If Chk1 = "1" Then
    entext2 = ""
    Else
    entext2 = "----" & "BAHT " & Dollars & Cents & "----"
    End If
End Function
      
' Converts a number from 100-999 into text
Function GetHundreds(ByVal MyNumber)
    Dim Result As String
    If Val(MyNumber) = 0 Then Exit Function
    MyNumber = Right("000" & MyNumber, 3)
    ' Convert the hundreds place.
    If Mid(MyNumber, 1, 1) <> "0" Then
        Result = GetDigit(Mid(MyNumber, 1, 1)) & "HUNDRED "
    End If
    ' Convert the tens and ones place.
    If Mid(MyNumber, 2, 1) <> "0" Then
        Result = Result & GetTens(Mid(MyNumber, 2))
    Else
        Result = Result & GetDigit(Mid(MyNumber, 3))
    End If
    GetHundreds = Result
End Function
      
' Converts a number from 10 to 99 into text.
Function GetTens(TensText)
    Dim Result As String
    Result = ""           ' Null out the temporary function value.
    If Val(Left(TensText, 1)) = 1 Then   ' If value between 10-19...
        Select Case Val(TensText)
            Case 10: Result = "TEN "
            Case 11: Result = "ELEVEN "
            Case 12: Result = "TWELVE "
            Case 13: Result = "THIRTEEN "
            Case 14: Result = "FOURTEEN "
            Case 15: Result = "FIFTEEN "
            Case 16: Result = "SISTEEN "
            Case 17: Result = "SEVENTEEN "
            Case 18: Result = "EIGHTEEN "
            Case 19: Result = "NINETEEN "
            Case Else
        End Select
    Else                                 ' If value between 20-99...
        Select Case Val(Left(TensText, 1))
            Case 2: Result = "TWENTY "
            Case 3: Result = "THIRTY "
            Case 4: Result = "FORTY "
            Case 5: Result = "FIFTY "
            Case 6: Result = "SIXTY "
            Case 7: Result = "SEVENTY "
            Case 8: Result = "EIGHTY "
            Case 9: Result = "NINETY "
            Case Else
        End Select
        Result = Result & GetDigit(Right(TensText, 1))  ' Retrieve ones place.
    End If
    GetTens = Result
End Function
     
' Converts a number from 1 to 9 into text.
Function GetDigit(Digit)
    Select Case Val(Digit)
        Case 1: GetDigit = "ONE "
        Case 2: GetDigit = "TWO "
        Case 3: GetDigit = "THREE "
        Case 4: GetDigit = "FOUR "
        Case 5: GetDigit = "FIVE "
        Case 6: GetDigit = "SIX "
        Case 7: GetDigit = "SEVEN "
        Case 8: GetDigit = "EIGHT "
        Case 9: GetDigit = "NINE "
        Case Else: GetDigit = ""
    End Select
End Function
