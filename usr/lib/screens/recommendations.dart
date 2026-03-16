import 'package:flutter/material.dart';

class RecommendationsScreen extends StatelessWidget {
  const RecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Actionable Insights'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.attach_money), text: 'FinOps (Cost)'),
              Tab(icon: Icon(Icons.health_and_safety), text: 'RAS (Reliability)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildFinOpsTab(context),
            _buildRASTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFinOpsTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildInsightCard(
          context,
          title: 'Right-size Underutilized EC2 Instances',
          description: '5 instances in us-west-2 have < 10% CPU utilization over the last 14 days. Downgrading them will save costs without impacting performance.',
          impact: 'Save \$340/mo',
          impactColor: Colors.green,
          icon: Icons.memory,
          severity: 'High Impact',
        ),
        _buildInsightCard(
          context,
          title: 'Delete Unattached EBS Volumes',
          description: 'Found 12 unattached EBS volumes that are no longer in use by any active instances.',
          impact: 'Save \$125/mo',
          impactColor: Colors.green,
          icon: Icons.storage,
          severity: 'Medium Impact',
        ),
        _buildInsightCard(
          context,
          title: 'Purchase Compute Savings Plan',
          description: 'Based on your consistent usage over the last 6 months, a 1-year Compute Savings Plan could significantly reduce your on-demand spend.',
          impact: 'Save ~\$800/mo',
          impactColor: Colors.green,
          icon: Icons.account_balance_wallet,
          severity: 'High Impact',
        ),
      ],
    );
  }

  Widget _buildRASTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildInsightCard(
          context,
          title: 'Enable Multi-AZ for Production RDS',
          description: 'Your primary database (db-prod-main) is currently running in a single Availability Zone. Enabling Multi-AZ will improve fault tolerance.',
          impact: 'Improves Availability',
          impactColor: Colors.blue,
          icon: Icons.dns,
          severity: 'Critical',
        ),
        _buildInsightCard(
          context,
          title: 'Update Deprecated Lambda Runtimes',
          description: '3 Lambda functions are using Node.js 14.x which is deprecated. Update to Node.js 18.x to ensure continued support and security patches.',
          impact: 'Improves Serviceability',
          impactColor: Colors.orange,
          icon: Icons.code,
          severity: 'Warning',
        ),
        _buildInsightCard(
          context,
          title: 'Implement Dead Letter Queues (DLQ)',
          description: 'Several SQS queues do not have a DLQ configured. Messages that fail processing might be lost permanently.',
          impact: 'Improves Reliability',
          impactColor: Colors.blue,
          icon: Icons.queue,
          severity: 'Medium',
        ),
      ],
    );
  }

  Widget _buildInsightCard(
    BuildContext context, {
    required String title,
    required String description,
    required String impact,
    required Color impactColor,
    required IconData icon,
    required String severity,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: severity == 'Critical' || severity == 'High Impact' 
                              ? Colors.red.withOpacity(0.2) 
                              : Colors.orange.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          severity,
                          style: TextStyle(
                            fontSize: 12,
                            color: severity == 'Critical' || severity == 'High Impact' 
                                ? Colors.redAccent 
                                : Colors.orangeAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(color: Colors.grey[400], height: 1.4),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  impact,
                  style: TextStyle(
                    color: impactColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Take Action'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
