import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../core/theme.dart';
import '../providers/cart_provider.dart';
import 'order_confirmation_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentStep = 0;
  final double _shipping = 10.00;
  final double _discount = 5.00;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: CosmoTheme.creamWhite,
      appBar: AppBar(
        title: Text(
          'CHECKOUT',
          style: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: CosmoTheme.roseGold,
              secondary: CosmoTheme.roseGold,
            ),
          ),
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: _currentStep,
            onStepTapped: (step) => setState(() => _currentStep = step),
            onStepContinue: () {
              if (_currentStep < 2) {
                setState(() => _currentStep += 1);
              } else {
                cartProvider.clearCart();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderConfirmationScreen()),
                );
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() => _currentStep -= 1);
              }
            },
            controlsBuilder: (context, controls) {
              return Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controls.onStepContinue,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _currentStep == 2 ? CosmoTheme.roseGold : CosmoTheme.deepCharcoal,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          _currentStep == 2 ? 'PLACE ORDER' : 'CONTINUE',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    if (_currentStep > 0) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: controls.onStepCancel,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(color: CosmoTheme.deepCharcoal),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            'BACK',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: CosmoTheme.deepCharcoal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
            steps: [
              Step(
                title: const Text('Address'),
                isActive: _currentStep >= 0,
                state: _currentStep > 0 ? StepState.complete : StepState.indexed,
                content: _buildAddressForm(),
              ),
              Step(
                title: const Text('Payment'),
                isActive: _currentStep >= 1,
                state: _currentStep > 1 ? StepState.complete : StepState.indexed,
                content: _buildPaymentOptions(),
              ),
              Step(
                title: const Text('Confirm'),
                isActive: _currentStep >= 2,
                content: _buildOrderSummary(cartProvider),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddressForm() {
    return Column(
      children: [
        _buildTextField('Full Name', Icons.person_outline),
        const SizedBox(height: 16),
        _buildTextField('Phone Number', Icons.phone_android_outlined),
        const SizedBox(height: 16),
        _buildTextField('Street Address', Icons.home_outlined),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildTextField('City', null)),
            const SizedBox(width: 16),
            Expanded(child: _buildTextField('Pincode', null)),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField(String label, IconData? icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.lato(color: Colors.grey),
        prefixIcon: icon != null ? Icon(icon, color: CosmoTheme.roseGold) : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }

  Widget _buildPaymentOptions() {
    String selectedPayment = 'card';
    return Column(
      children: [
        _buildPaymentTile('Credit/Debit Card', Icons.credit_card, 'card', selectedPayment),
        const SizedBox(height: 12),
        _buildPaymentTile('UPI / Digital Wallet', Icons.account_balance_wallet_outlined, 'upi', selectedPayment),
        const SizedBox(height: 12),
        _buildPaymentTile('Cash on Delivery', Icons.payments_outlined, 'cod', selectedPayment),
      ],
    );
  }

  Widget _buildPaymentTile(String title, IconData icon, String value, String selected) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: value == selected ? CosmoTheme.roseGold : Colors.grey.shade200,
          width: 2,
        ),
      ),
      child: RadioListTile(
        value: value,
        groupValue: selected,
        onChanged: (v) {},
        activeColor: CosmoTheme.roseGold,
        secondary: Icon(icon, color: CosmoTheme.deepCharcoal),
        title: Text(
          title,
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildOrderSummary(CartProvider cartProvider) {
    final subtotal = cartProvider.subtotal;
    final total = subtotal + _shipping - _discount;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(height: 32),
          _summaryRow('Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
          const SizedBox(height: 8),
          _summaryRow('Shipping', '\$${_shipping.toStringAsFixed(2)}'),
          const SizedBox(height: 8),
          _summaryRow('Discount', '-\$${_discount.toStringAsFixed(2)}'),
          const Divider(height: 24),
          _summaryRow('Total Amount', '\$${total.toStringAsFixed(2)}', isTotal: true),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.lato(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.lato(
            fontSize: isTotal ? 18 : 14,
            fontWeight: FontWeight.bold,
            color: isTotal ? CosmoTheme.roseGold : Colors.black,
          ),
        ),
      ],
    );
  }
}

