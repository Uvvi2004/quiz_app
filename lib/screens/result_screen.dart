import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultScreen({super.key, required this.score, required this.total});

  String get _message {
    final pct = score / total;
    if (pct == 1.0) return 'Perfect Score! 🏆';
    if (pct >= 0.8) return 'Excellent! 🎉';
    if (pct >= 0.6) return 'Good Job! 👍';
    if (pct >= 0.4) return 'Keep Practicing! 💪';
    return 'Better luck next time! 🎯';
  }

  Color get _scoreColor {
    final pct = score / total;
    if (pct == 1.0) return Colors.amber;
    if (pct >= 0.8) return Colors.green;
    if (pct >= 0.6) return Colors.teal;
    if (pct >= 0.4) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/trophy.png',
                width: 140,
                height: 140,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.emoji_events,
                  size: 100,
                  color: _scoreColor,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Quiz Complete!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 28),
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: _scoreColor, width: 6),
                  boxShadow: [
                    BoxShadow(
                      color: _scoreColor.withOpacity(0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$score / $total',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: _scoreColor,
                      ),
                    ),
                    const Text(
                      'Score',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                _message,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const QuizScreen()),
                ),
                icon: const Icon(Icons.refresh),
                label: const Text('Play Again'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}