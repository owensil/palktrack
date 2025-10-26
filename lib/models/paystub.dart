import 'dart:convert';

class Paystub {
  final int id;                            // idk yet
  final String employerName;
  final DateTime payPeriodStart;
  final DateTime payPeriodEnd;
  final DateTime payDate;
  final List<EarningLine> earnings;
  final List<DeductionLine> deductions;
  final List<TaxLine> taxes;
  final List<ContributionLine> contributions;
  final double totalDeductions;
  final double totalTaxes;
  final double totalContributions;
  final double grossPay;
  final double netPay;   // grossPay - totalDeductions - totalTaxes
  final double ytdGross;
  final double ytdNet;
  final String notes;

  Paystub({
    this.id = 0,
    this.employerName = '',
    required this.payPeriodStart,
    required this.payPeriodEnd,
    required this.payDate,
    this.earnings = const [],
    this.deductions = const [],
    this.taxes = const [],
    this.contributions = const [],
    this.grossPay = 0.0,
    this.totalDeductions = 0.0,
    this.totalTaxes = 0.0,
    this.totalContributions = 0.0,
    this.netPay = 0.0,
    this.ytdGross = 0.0,
    this.ytdNet = 0.0,
    this.notes = '',
  });

  Paystub copyWith({
    int? id,
    String? employerName,
    DateTime? payPeriodStart,
    DateTime? payPeriodEnd,
    DateTime? payDate,
    List<EarningLine>? earnings,
    List<DeductionLine>? deductions,
    List<TaxLine>? taxes,
    List<ContributionLine>? contributions,
    double? grossPay,
    double? totalDeductions,
    double? totalTaxes,
    double? totalContributions,
    double? netPay,
    double? ytdGross,
    double? ytdNet,
    String? notes,
  }) {
    return Paystub(
      id: id ?? this.id,
      employerName: employerName ?? this.employerName,
      payPeriodStart: payPeriodStart ?? this.payPeriodStart,
      payPeriodEnd: payPeriodEnd ?? this.payPeriodEnd,
      payDate: payDate ?? this.payDate,
      earnings: earnings ?? this.earnings,
      deductions: deductions ?? this.deductions,
      taxes: taxes ?? this.taxes,
      contributions: contributions ?? this.contributions,
      grossPay: grossPay ?? this.grossPay,
      totalDeductions: totalDeductions ?? this.totalDeductions,
      totalTaxes: totalTaxes ?? this.totalTaxes,
      totalContributions: totalContributions ?? this.totalContributions,
      netPay: netPay ?? this.netPay,
      ytdGross: ytdGross ?? this.ytdGross,
      ytdNet: ytdNet ?? this.ytdNet,
      notes: notes ?? this.notes,
    );
  }

  factory Paystub.fromJson(Map<String, dynamic> json) {
    List<EarningLine> parseEarnings(dynamic list) {
      if (list is! List) return [];
      return list.map((e) => EarningLine.fromJson(Map<String, dynamic>.from(e))).toList();
    }

    List<DeductionLine> parseDeductions(dynamic list) {
      if (list is! List) return [];
      return list.map((e) => DeductionLine.fromJson(Map<String, dynamic>.from(e))).toList();
    }

    List<TaxLine> parseTaxes(dynamic list) {
      if (list is! List) return [];
      return list.map((e) => TaxLine.fromJson(Map<String, dynamic>.from(e))).toList();
    }

    List<ContributionLine> parseContributions(dynamic list) {
      if (list is! List) return [];
      return list.map((e) => ContributionLine.fromJson(Map<String, dynamic>.from(e))).toList();
    }

    return Paystub(
      id: json['id'] as int? ?? 0,
      employerName: json['employerName'] as String? ?? '',
      payPeriodStart: DateTime.parse(json['payPeriodStart'] as String),
      payPeriodEnd: DateTime.parse(json['payPeriodEnd'] as String),
      payDate: DateTime.parse(json['payDate'] as String),
      earnings: parseEarnings(json['earnings']),
      deductions: parseDeductions(json['deductions']),
      taxes: parseTaxes(json['taxes']),
      contributions: parseContributions(json['contributions']),
      grossPay: (json['grossPay'] as num).toDouble(),
      totalDeductions: (json['totalDeductions'] as num).toDouble(),
      totalTaxes: (json['totalTaxes'] as num).toDouble(),
      totalContributions: (json['totalContributions'] as num).toDouble(),
      netPay: (json['netPay'] as num).toDouble(),
      ytdGross: (json['ytdGross'] as num).toDouble(),
      ytdNet: (json['ytdNet'] as num).toDouble(),
      notes: json['notes'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employerName': employerName,
      'payPeriodStart': payPeriodStart.toIso8601String(),
      'payPeriodEnd': payPeriodEnd.toIso8601String(),
      'payDate': payDate.toIso8601String(),
      'earnings': earnings.map((e) => e.toJson()).toList(),
      'deductions': deductions.map((d) => d.toJson()).toList(),
      'taxes': taxes.map((t) => t.toJson()).toList(),
      'contributions': contributions.map((c) => c.toJson()).toList(),
      'grossPay': grossPay,
      'totalDeductions': totalDeductions,
      'totalTaxes': totalTaxes,
      'totalContributions': totalContributions,
      'netPay': netPay,
      'ytdGross': ytdGross,
      'ytdNet': ytdNet,
      'notes': notes,
    };
  }

  @override
  String toString() => 'Paystub(id: $id, netPay: $netPay)';
}

class EarningLine {
  final String description;
  final double hours;
  final double rate;

  EarningLine({
    required this.description,
    required this.hours,
    required this.rate,
  });

  factory EarningLine.fromJson(Map<String, dynamic> json) {
    return EarningLine(
      description: json['description'] as String? ?? '',
      hours: (json['hours'] as num?)?.toDouble() ?? 0.0,
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'hours': hours,
        'rate': rate,
      };

  @override
  String toString() => 'Earning(description: $description, amount: $amount)';
}

class DeductionLine {
  final String description;
  final double amount;
  final bool preTax; // true = pre-tax deduction, false = post-tax

  DeductionLine({
    required this.description,
    required this.amount,
    this.preTax = false,
  });

  factory DeductionLine.fromJson(Map<String, dynamic> json) {
    return DeductionLine(
      description: json['description'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      preTax: json['preTax'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'amount': amount,
        'preTax': preTax,
      };

  @override
  String toString() => 'Deduction(description: $description, amount: $amount)';
}

class TaxLine {
  final String description;
  final double amount;
  final double rate; // optional percentage e.g. 0.062 for 6.2%

  TaxLine({
    required this.description,
    required this.amount,
    this.rate = 0.0,
  });

  factory TaxLine.fromJson(Map<String, dynamic> json) {
    return TaxLine(
      description: json['description'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'amount': amount,
        'rate': rate,
      };

  @override
  String toString() => 'Tax(description: $description, amount: $amount)';
}

class ContributionLine {
  final String description;
  final double amount;
  final bool employerPaid;

  ContributionLine({
    required this.description,
    required this.amount,
    this.employerPaid = false,
  });

  factory ContributionLine.fromJson(Map<String, dynamic> json) {
    return ContributionLine(
      description: json['description'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      employerPaid: json['employerPaid'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'amount': amount,
        'employerPaid': employerPaid,
      };

  @override
  String toString() => 'Contribution(description: $description, amount: $amount)';
}

// Helper to convert JSON string to Paystub and back
Paystub paystubFromJsonString(String jsonString) =>
    Paystub.fromJson(json.decode(jsonString) as Map<String, dynamic>);

String paystubToJsonString(Paystub paystub) => json.encode(paystub.toJson());