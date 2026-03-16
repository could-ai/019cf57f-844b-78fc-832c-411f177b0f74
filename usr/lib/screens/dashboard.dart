import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CloudOps Overview'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'FinOps Metrics',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  context,
                  title: 'MTD Spend',
                  value: '\$12,450',
                  subtitle: '+5.2% vs last month',
                  icon: Icons.attach_money,
                  color: Colors.orange,
                  isPositive: false,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMetricCard(
                  context,
                  title: 'Est. Savings',
                  value: '\$1,240',
                  subtitle: 'Pending actions',
                  icon: Icons.savings_outlined,
                  color: Colors.green,
                  isPositive: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'RAS Metrics (Reliability & Availability)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  context,
                  title: 'System Uptime',
                  value: '99.99%',
                  subtitle: 'Last 30 days',
                  icon: Icons.check_circle_outline,
                  color: Colors.teal,
                  isPositive: true,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMetricCard(
                  context,
                  title: 'Active Alerts',
                  value: '2',
                  subtitle: '1 Critical, 1 Warn',
                  icon: Icons.warning_amber_rounded,
                  color: Colors.redAccent,
                  isPositive: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'Recent Anomalies',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildAnomalyTile(
            context,
            title: 'Spike in Data Transfer Costs',
            description: 'us-east-1 NAT Gateway traffic increased by 400%',
            time: '2 hours ago',
            icon: Icons.trending_up,
            color: Colors.orange,
          ),
          _buildAnomalyTile(
            context,
            title: 'High Latency on API Gateway',
            description: 'P99 latency exceeded 2000ms for /checkout endpoint',
            time: '5 hours ago',
            icon: Icons.speed,
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(
    BuildContext context, {
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
    required bool isPositive,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 28),
                Icon(
                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isPositive ? Colors.green : Colors.red,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: isPositive ? Colors.green : Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnomalyTile(
    BuildContext context, {
    required String title,
    required String description,
    required String time,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(description),
            const SizedBox(height: 4),
            Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
          ],
        ),
        isThreeLine: true,
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
