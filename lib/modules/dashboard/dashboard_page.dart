import 'package:qfinity/export.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<DashboardController>(
        builder: (controller) {
          return Column(
            children: [
              const Row(
                children: [
                  MainFormTitle(title: 'Dashboard'),
                ],
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            sizes: 'lg-8',
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Expanded(
                                        child: MyText.titleMedium(
                                          'Voucher Count',
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: 600,
                                        ),
                                      ),
                                      CommonDropdownMenu<DateTimeFilterDropdown>(
                                        items: controller.dateTimeFilterItems,
                                        onSelected: controller.onSelectedDateFilter,
                                        selectedItem: controller.selectedDateFilter,
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    height: 32,
                                  ),
                                  MyFlex(
                                    contentPadding: false,
                                    children: [
                                      MyFlexItem(
                                        sizes: 'lg-3',
                                        child: VoucherCountCard(
                                          color: UIConstants.contentTheme.pink,
                                          icon: FontAwesomeIcons.lightMoneyBill,
                                          voucherType: VoucherType.billwisePayment,
                                          count: controller.vouchersCount.countOfOrZeroIfAbsent(
                                            VoucherType.billwisePayment,
                                          ),
                                        ),
                                      ),
                                      MyFlexItem(
                                        sizes: 'lg-3',
                                        child: VoucherCountCard(
                                          color: UIConstants.contentTheme.info,
                                          icon: FontAwesomeIcons.lightMoneyBill1Wave,
                                          voucherType: VoucherType.purchase,
                                          count: controller.vouchersCount.countOfOrZeroIfAbsent(
                                            VoucherType.purchase,
                                          ),
                                        ),
                                      ),
                                      MyFlexItem(
                                        sizes: 'lg-3',
                                        child: VoucherCountCard(
                                          color: UIConstants.contentTheme.success,
                                          icon: FontAwesomeIcons.lightReceipt,
                                          voucherType: VoucherType.billwiseReceipt,
                                          count: controller.vouchersCount.countOfOrZeroIfAbsent(
                                            VoucherType.billwiseReceipt,
                                          ),
                                        ),
                                      ),
                                      MyFlexItem(
                                        sizes: 'lg-3',
                                        child: VoucherCountCard(
                                          color: UIConstants.contentTheme.danger,
                                          icon: FontAwesomeIcons.lightCircleDollar,
                                          voucherType: VoucherType.payment,
                                          count: controller.vouchersCount.countOfOrZeroIfAbsent(
                                            VoucherType.payment,
                                          ),
                                        ),
                                      ),
                                      MyFlexItem(
                                        sizes: 'lg-3',
                                        child: VoucherCountCard(
                                          color: UIConstants.contentTheme.purple,
                                          icon: FontAwesomeIcons.lightBookJournalWhills,
                                          voucherType: VoucherType.journal,
                                          count: controller.vouchersCount.countOfOrZeroIfAbsent(
                                            VoucherType.journal,
                                          ),
                                        ),
                                      ),
                                      MyFlexItem(
                                        sizes: 'lg-3',
                                        child: VoucherCountCard(
                                          color: UIConstants.contentTheme.red,
                                          icon: FontAwesomeIcons.lightSendBack,
                                          voucherType: VoucherType.contra,
                                          count: controller.vouchersCount.countOfOrZeroIfAbsent(
                                            VoucherType.contra,
                                          ),
                                        ),
                                      ),
                                      MyFlexItem(
                                        sizes: 'lg-3',
                                        child: VoucherCountCard(
                                          color: UIConstants.contentTheme.warning,
                                          icon: FontAwesomeIcons.lightCartFlatbedSuitcase,
                                          voucherType: VoucherType.sale,
                                          count: controller.vouchersCount.countOfOrZeroIfAbsent(
                                            VoucherType.sale,
                                          ),
                                        ),
                                      ),
                                      MyFlexItem(
                                        sizes: 'lg-3',
                                        child: VoucherCountCard(
                                          color: UIConstants.contentTheme.danger,
                                          icon: FontAwesomeIcons.lightMoneyCheck,
                                          voucherType: VoucherType.pettyCash,
                                          count: controller.vouchersCount.countOfOrZeroIfAbsent(
                                            VoucherType.pettyCash,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          MyFlexItem(
                            sizes: 'lg-4',
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              height: 403,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              padding: MySpacing.only(left: 24, right: 12, top: 12),
                              color: UIConstants.contentTheme.dark,
                              child: Stack(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              MyText.titleMedium(
                                                'New Visitors',
                                                color: UIConstants.contentTheme.light,
                                                fontWeight: 600,
                                              ),
                                              MySpacing.width(8),
                                              MyContainer(
                                                padding: MySpacing.xy(12, 2),
                                                color: UIConstants.contentTheme.success,
                                                child: MyText.bodyMedium(
                                                  'Active',
                                                  fontSize: 12,
                                                  color: UIConstants.contentTheme.onSuccess,
                                                ),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              FontAwesomeIcons.lightArrowRight,
                                              size: 15,
                                              color: UIConstants.contentTheme.light,
                                            ),
                                          ),
                                        ],
                                      ),
                                      MySpacing.height(16),
                                      Row(
                                        children: [
                                          MyDottedLine(
                                            height: 50,
                                            dottedLength: 1,
                                            color: Colors.grey.shade400,
                                            child: Padding(
                                              padding: MySpacing.xy(12, 8),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  MyText.bodyMedium(
                                                    r'$5,943',
                                                    fontSize: 20,
                                                    color: UIConstants.contentTheme.light,
                                                  ),
                                                  MySpacing.height(8),
                                                  MyText.bodyMedium(
                                                    'New Followers',
                                                    color: UIConstants.contentTheme.light,
                                                    fontWeight: 600,
                                                    muted: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          MySpacing.width(16),
                                          MyDottedLine(
                                            height: 50,
                                            dottedLength: 1,
                                            color: Colors.grey.shade400,
                                            child: Padding(
                                              padding: MySpacing.xy(12, 8),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  MyText.bodyMedium(
                                                    '150,000',
                                                    fontSize: 20,
                                                    color: UIConstants.contentTheme.light,
                                                  ),
                                                  MySpacing.height(8),
                                                  MyText.bodyMedium(
                                                    'Followers Goal',
                                                    color: UIConstants.contentTheme.light,
                                                    fontWeight: 600,
                                                    muted: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(16),
                                  Positioned(
                                    right: 0,
                                    left: 0,
                                    top: 100,
                                    child: SfCartesianChart(
                                      plotAreaBorderWidth: 0,
                                      tooltipBehavior: controller.facebook,
                                      primaryXAxis: const CategoryAxis(
                                        isVisible: false,
                                        majorGridLines: MajorGridLines(width: 0),
                                        labelStyle: TextStyle(fontSize: 0),
                                      ),
                                      primaryYAxis: const NumericAxis(
                                        isVisible: false,
                                        labelStyle: TextStyle(fontSize: 0),
                                        majorGridLines: MajorGridLines(width: 0),
                                      ),
                                      series: [
                                        ColumnSeries<ChartSampleData, int>(
                                          width: 0.5,
                                          color: UIConstants.contentTheme.primary,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                          dataSource: controller.facebookChart,
                                          xValueMapper: (ChartSampleData data, _) => data.x,
                                          yValueMapper: (ChartSampleData data, _) => data.y,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            sizes: 'lg-8 xl-8',
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              paddingAll: 0,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: MySpacing.all(16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Expanded(
                                          child: MyText.titleMedium(
                                            'Response time by location',
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: 600,
                                          ),
                                        ),
                                        PopupMenuButton(
                                          onSelected: controller.onSelectedTimeByLocation,
                                          itemBuilder: (BuildContext context) {
                                            return [
                                              'Year',
                                              'Month',
                                              'Week',
                                              'Day',
                                              'Hours',
                                            ].map((behavior) {
                                              return PopupMenuItem(
                                                value: behavior,
                                                height: 32,
                                                child: MyText.bodySmall(
                                                  behavior,
                                                  color: theme.colorScheme.onSurface,
                                                  fontWeight: 600,
                                                ),
                                              );
                                            }).toList();
                                          },
                                          color: theme.cardTheme.color,
                                          child: MyContainer.bordered(
                                            padding: MySpacing.xy(12, 8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                MyText.labelMedium(
                                                  controller.selectedTimeByLocation,
                                                  color: theme.colorScheme.onSurface,
                                                ),
                                                ChevronDownIcon(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  MySpacing.height(12),
                                  MyFlex(
                                    children: [
                                      MyFlexItem(
                                        sizes: 'lg-3',
                                        child: buildResponseTimeByLocationData(
                                          'Current Week',
                                          r'$1859.52',
                                          FontAwesomeIcons.lightTurnUp,
                                          UIConstants.contentTheme.success,
                                        ),
                                      ),
                                      MyFlexItem(
                                        sizes: 'lg-3',
                                        child: buildResponseTimeByLocationData(
                                          'Previous Week',
                                          r'$1568',
                                          FontAwesomeIcons.lightTurnDown,
                                          UIConstants.contentTheme.red,
                                        ),
                                      ),
                                      MyFlexItem(
                                        sizes: 'lg-3',
                                        child: buildResponseTimeByLocationData(
                                          'Conversation',
                                          '5.68%',
                                          FontAwesomeIcons.lightTurnUp,
                                          UIConstants.contentTheme.success,
                                        ),
                                      ),
                                      MyFlexItem(
                                        sizes: 'lg-3',
                                        child: buildResponseTimeByLocationData(
                                          'Customers',
                                          '80K',
                                          FontAwesomeIcons.lightTurnDown,
                                          UIConstants.contentTheme.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(12),
                                  const Divider(),
                                  Padding(
                                    padding: MySpacing.all(16),
                                    child: SfCartesianChart(
                                      primaryXAxis: const CategoryAxis(),
                                      tooltipBehavior: controller.chart,
                                      axes: <ChartAxis>[
                                        NumericAxis(
                                          numberFormat: NumberFormat.compact(),
                                          majorGridLines: const MajorGridLines(width: 0),
                                          opposedPosition: true,
                                          name: 'yAxis1',
                                          interval: 1000,
                                          minimum: 0,
                                          maximum: 7000,
                                        ),
                                      ],
                                      series: [
                                        ColumnSeries<ChartSampleData, String>(
                                          animationDuration: 2000,
                                          width: 0.5,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                          color: UIConstants.contentTheme.primary,
                                          dataSource: controller.chartData,
                                          xValueMapper: (ChartSampleData data, _) => data.x,
                                          yValueMapper: (ChartSampleData data, _) => data.y,
                                          name: 'Unit Sold',
                                        ),
                                        LineSeries<ChartSampleData, String>(
                                          animationDuration: 4500,
                                          animationDelay: 2000,
                                          dataSource: controller.chartData,
                                          xValueMapper: (ChartSampleData data, _) => data.x,
                                          yValueMapper: (ChartSampleData data, _) => data.yValue,
                                          yAxisName: 'yAxis1',
                                          markerSettings: const MarkerSettings(
                                            isVisible: true,
                                          ),
                                          name: 'Total Transaction',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          MyFlexItem(
                            sizes: 'lg-4',
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              paddingAll: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const MyText.titleMedium(
                                        'Cost BreakDown',
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: 600,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          FontAwesomeIcons.lightArrowRight,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SfCircularChart(
                                    tooltipBehavior: TooltipBehavior(enable: true),
                                    series: <CircularSeries>[
                                      DoughnutSeries<ChartSampleData, String>(
                                        explode: true,
                                        dataSource: controller.circleChart,
                                        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
                                        xValueMapper: (ChartSampleData data, _) => data.x,
                                        yValueMapper: (ChartSampleData data, _) => data.y,
                                        dataLabelSettings: const DataLabelSettings(
                                          isVisible: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // MySpacing.height(12),
                                  Column(
                                    children: [
                                      const Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText.titleMedium('Top Channel'),
                                          MyText.titleMedium('Value'),
                                        ],
                                      ),
                                      MySpacing.height(12),
                                      buildCircleChartData(
                                        const Color.fromRGBO(9, 0, 136, 1),
                                        'Salary',
                                        r'$41,458',
                                      ),
                                      MySpacing.height(8),
                                      buildCircleChartData(
                                        const Color.fromRGBO(
                                          147,
                                          0,
                                          119,
                                          1,
                                        ),
                                        'Bill',
                                        r'$48,125',
                                      ),
                                      MySpacing.height(8),
                                      buildCircleChartData(
                                        const Color.fromRGBO(
                                          228,
                                          0,
                                          124,
                                          1,
                                        ),
                                        'Marketing',
                                        r'$19,458',
                                      ),
                                      MySpacing.height(8),
                                      buildCircleChartData(
                                        const Color.fromRGBO(
                                          255,
                                          189,
                                          57,
                                          1,
                                        ),
                                        'Other',
                                        r'$10,589',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            sizes: 'lg-6',
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const MyText.titleMedium(
                                        'High Value Design',
                                        fontWeight: 600,
                                      ),
                                      Row(
                                        children: [
                                          PopupMenuButton(
                                            onSelected: controller.onSelectedTimeDesign,
                                            itemBuilder: (BuildContext context) {
                                              return [
                                                'Year',
                                                'Month',
                                                'Week',
                                                'Day',
                                                'Hours',
                                              ].map((behavior) {
                                                return PopupMenuItem(
                                                  value: behavior,
                                                  height: 32,
                                                  child: MyText.bodySmall(
                                                    behavior,
                                                    color: theme.colorScheme.onSurface,
                                                    fontWeight: 600,
                                                  ),
                                                );
                                              }).toList();
                                            },
                                            color: theme.cardTheme.color,
                                            child: MyContainer.bordered(
                                              padding: MySpacing.xy(12, 8),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  MyText.labelMedium(
                                                    controller.selectedTimeDesign,
                                                    color: theme.colorScheme.onSurface,
                                                  ),
                                                  ChevronDownIcon(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(16),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: MyContainer.bordered(
                                      paddingAll: 0,
                                      child: DataTable(
                                        onSelectAll: (_) => {},
                                        headingRowColor: WidgetStatePropertyAll(
                                          UIConstants.contentTheme.primary.withAlpha(40),
                                        ),
                                        dataRowMaxHeight: 50,
                                        columns: const [
                                          DataColumn(
                                            label: MyText.labelLarge(
                                              'Value',
                                            ),
                                          ),
                                          DataColumn(
                                            label: MyText.labelLarge(
                                              'Sum',
                                            ),
                                          ),
                                          DataColumn(
                                            label: MyText.labelLarge(
                                              'Metric',
                                            ),
                                          ),
                                          DataColumn(
                                            label: MyText.labelLarge(
                                              'Tag',
                                            ),
                                          ),
                                        ],
                                        rows: controller.dashboard
                                            .mapIndexed(
                                              (index, data) => DataRow(
                                                cells: [
                                                  DataCell(
                                                    MyText.bodyMedium(
                                                      '${data.value}',
                                                    ),
                                                  ),
                                                  DataCell(
                                                    MyText.bodyMedium(
                                                      '${data.sum}',
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Row(
                                                      children: [
                                                        MyContainer(
                                                          paddingAll: 0,
                                                          borderRadiusAll: 22,
                                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                                          child: Image.asset(
                                                            controller.dashboard[index].image,
                                                            height: 32,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        MySpacing.width(16),
                                                        Expanded(
                                                          child: MyText.bodyMedium(
                                                            data.metric,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  DataCell(
                                                    MyText.bodyMedium(
                                                      data.tag,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          MyFlexItem(
                            sizes: 'lg-6',
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: MySpacing.x(8),
                                        child: const MyText.titleMedium(
                                          'Revenue Chart',
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: 600,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          FontAwesomeIcons.lightArrowRight,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(16),
                                  SizedBox(
                                    height: 308,
                                    child: SfCartesianChart(
                                      plotAreaBorderWidth: 0,
                                      tooltipBehavior: controller.revenue,
                                      primaryXAxis: const CategoryAxis(
                                        majorGridLines: MajorGridLines(width: 0),
                                      ),
                                      series: [
                                        SplineSeries<ChartSampleData, String>(
                                          color: const Color(0xff727cf5),
                                          dataLabelSettings: const DataLabelSettings(
                                            borderWidth: 100,
                                          ),
                                          dataSource: controller.revenueChart1,
                                          xValueMapper: (ChartSampleData data, _) => data.x,
                                          yValueMapper: (ChartSampleData data, _) => data.y,
                                        ),
                                        SplineSeries<ChartSampleData, String>(
                                          color: const Color(0xff0acf97),
                                          dataSource: controller.revenueChart2,
                                          xValueMapper: (ChartSampleData data, _) => data.x,
                                          yValueMapper: (ChartSampleData data, _) => data.y,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildCircleChartData(Color color, String name, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            MyContainer.rounded(
              paddingAll: 4,
              color: color,
            ),
            MySpacing.width(8),
            MyText.bodyMedium(name),
          ],
        ),
        MyText.bodyMedium(price),
      ],
    );
  }

  Widget buildResponseTimeByLocationData(
    String currentTime,
    String price,
    IconData icon,
    Color iconColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.lightCircleDashed,
              size: 16,
            ),
            MySpacing.width(8),
            MyText.bodyMedium(
              currentTime,
            ),
          ],
        ),
        MySpacing.height(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText.bodyLarge(
              price,
              fontSize: 20,
              fontWeight: 600,
              muted: true,
            ),
            MySpacing.width(8),
            Icon(
              icon,
              size: 16,
              color: iconColor,
            ),
          ],
        ),
      ],
    );
  }
}
