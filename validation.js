        function isFNameValid() {
            var FName = document.getElementById("ContentPlaceHolder1_txtFName").value.trim()
            if (FName == "") {
                document.getElementById("lblFNameErrMsg").innerText = "Please enter First Name";
            } else if (FName.length > 50) {
                document.getElementById("lblFNameErrMsg").innerText = "First Name must be less than 50 characters";
            }
            else {
                document.getElementById("lblFNameErrMsg").innerText = "";
            }
        }

        function isLNameValid() {
            var LName = document.getElementById("txtLName").value.trim()
            if (LName == "") {
                document.getElementById("lblLNameErrMsg").innerText = "Please enter Last Name";
            } else if (LName.length > 50) {
                document.getElementById("lblLNameErrMsg").innerText = "Last Name must be less than 50 characters";
            }
            else {
                document.getElementById("lblLNameErrMsg").innerText = "";
            }
        }

        function isPhoneValid() {
            var regExpForDigits = /^[0-9]+$/;
            var Phone = document.getElementById("txtPhone").value.trim()
            if (Phone == "") {
                document.getElementById("lblPhoneErrMsg").innerText = "Please enter Phone number";
            } else if (!regExpForDigits.test(Phone)) {
                document.getElementById("lblPhoneErrMsg").innerText = "Please enter only digits";
            } else if (Phone.length != 10) {
                document.getElementById("lblPhoneErrMsg").innerText = "Phone number must be 10 digits";
            } else {
                document.getElementById("lblPhoneErrMsg").innerText = "";
            }
        }

        function isAddress1Valid() {
            var Address1 = document.getElementById("txtAddress1").value.trim()
            if (Address1 == "") {
                document.getElementById("lblAddress1").innerText = "Please enter Address1";
            } else if (Address1.length > 50) {
                document.getElementById("lblAddress1").innerText = "Address1 must be less than 50 characters";
            } else {
                document.getElementById("lblAddress1").innerText = "";
            }
        }

        function isSuburbValid() {
            var Suburb = document.getElementById("txtSuburb").value.trim()
            if (Suburb == "") {
                document.getElementById("lblSuburb").innerText = "Please enter Suburb";
            } else if (Suburb.length > 50) {
                document.getElementById("lblSuburb").innerText = "Suburb must be less than 50 characters";
            } else {
                document.getElementById("lblSuburb").innerText = "";
            }
        }

        function isStateValid() {
            var State = document.getElementById("cboState").value
            if (State == "00") {
                document.getElementById("lblState").innerText = "Please select State";
            } else {
                document.getElementById("lblState").innerText = "";
            }
        }

        function isPostcodeValid() {
            var regExpForDigits = /^[0-9]+$/;
            var Postcode = document.getElementById("txtPostcode").value.trim()
            if (Postcode == "") {
                document.getElementById("lblPostcode").innerText = "Please enter Postcode";
            } else if (!regExpForDigits.test(Postcode)) {
                document.getElementById("lblPostcode").innerText = "Please enter only digits";
            } else if (Postcode.length != 4) {
                document.getElementById("lblPostcode").innerText = "Postcode must be 4 digits";
            } else {
                document.getElementById("lblPostcode").innerText = "";
            }
        }

        function isCtypeValid() {
            var Ctype = document.getElementById("cboCtype").value
            if (Ctype == "00") {
                document.getElementById("lblCtype").innerText = "Please select Card Type";
            } else {
                document.getElementById("lblCtype").innerText = "";
            }
        }

        function isCardNoValid() {
            var regExpForDigits = /^[0-9]+$/;
            var Ctype = document.getElementById("cboCtype").value
            var CardNo = document.getElementById("txtCardNo").value.trim()
            if (CardNo == "") {
                document.getElementById("lblCardNo").innerText = "Please enter CardNo";
            }
            else if (!regExpForDigits.test(CardNo)) {
                document.getElementById("lblCardNo").innerText = "Please enter only digits";
            }
            else if (Ctype == "AMEX" && CardNo.length != 15) {
                document.getElementById("lblCardNo").innerText = "Card Number must be 15 digits";
            }
            else if ((Ctype == "MasterCard" || Ctype == "VISA") && CardNo.length != 16) {
                document.getElementById("lblCardNo").innerText = "Card Number must be 16 digits";
            }
            else {
                document.getElementById("lblCardNo").innerText = "";
            }
        }

        function isExpiryDateValid() {
            var expiryYear = document.getElementById("cboYear").value;
            var expiryMonth = document.getElementById("cboMonth").value;

            if (expiryYear == "00") {
                document.getElementById("lblExpiryDate").innerText = "Please select correct Expiry Date";
            }
            else if (expiryMonth == "00") {
                document.getElementById("lblExpiryDate").innerText = "Please select correct Expiry Date";
            }
            else if (expiryYear != "00" && expiryMonth !== "00") {
                today = new Date();
                expiry = new Date(expiryYear, expiryMonth);
                if (today.getTime() > expiry.getTime()) {
                    document.getElementById("cboYear").value = "----";
                    document.getElementById("lblExpiryDate").innerText = "Please select correct Expiry Date";
                }
                else {
                    document.getElementById("lblExpiryDate").innerText = "";
                }
            }
            else {
                document.getElementById("lblExpiryDate").innerText = "";
            }
        }

        function clearExpiryYear() {
            document.getElementById("cboYear").value = "----";
        }

        function isEmailValid() {
            var regExpForEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            var Email = document.getElementById("txtEmail").value.trim()
            if (Email == "") {
                document.getElementById("lblEmail").innerText = "Please enter Email";
            } else if (!regExpForEmail.test(Email)) {
                document.getElementById("lblEmail").innerText = "Please enter valid Email";
            } else {
                document.getElementById("lblEmail").innerText = "";
            }
        }
