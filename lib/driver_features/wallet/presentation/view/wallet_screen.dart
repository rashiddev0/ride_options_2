import 'package:flutter/services.dart';

import '../../../../common/const/export.dart';

class ReferralWalletScreen extends StatelessWidget {
  const ReferralWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            walletBalanceCard(context),
            addHeight(20.h),
            referralDetailsCard(context),
            addHeight(20.h),
            referralCodeCard(context),
            addHeight(20.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:  EdgeInsets.symmetric(vertical: 16.sp),
                textStyle:  TextStyle(fontSize: 16.sp),
              ),
              child: const Text('Move referral balance to Wallet'),
            ),

          ],
        ),
      ),
    );

  }

  Widget walletBalanceCard(context){
    return Card(
      elevation: 4.0,
      surfaceTintColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding:  EdgeInsets.all(16.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                const Icon(Icons.account_balance_wallet),
                addWidth( 10.w),
                Text('Wallet:', style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            Text('Rs. 0', style: TextStyle(fontSize: 26.sp, color: AppColors.primary,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }




  Widget referralCodeCard(context){
    return Card(
      elevation: 4.0,
      surfaceTintColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding:  EdgeInsets.all(16.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('QBS554S', style:  Theme.of(context).textTheme.titleLarge,),
            IconButton(
              icon: const Icon(Icons.copy, color: Colors.blue),
              onPressed: () {
                Clipboard.setData(const ClipboardData(text: 'QBS554S'));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Referral code copied to clipboard')),
                );
              },
            ),
          ],
        ),
      ),
    );

  }



  Widget referralDetailsCard(context){

    return Row(
      children: [

        Expanded(
          child: Card(
            elevation: 4.0,
            surfaceTintColor: Theme.of(context).colorScheme.onPrimaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding:  EdgeInsets.all(20.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total accounts\n     referred:', style:  Theme.of(context).textTheme.titleSmall),
                  addHeight(10.h),
                  Text('07',  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ),
        addWidth(10.w),
        Expanded(
          child: Card(
            elevation: 4.0,
            surfaceTintColor: Theme.of(context).colorScheme.onPrimaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding:  EdgeInsets.all(20.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Referral\nbalance:', style:  Theme.of(context).textTheme.titleSmall),
                  addHeight(10.h),
                  Text('Rs. 307', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}



