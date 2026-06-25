// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ViaCepModel {
  final String zipCode;
  final String street;
  final String complement;
  final String unit;
  final String neighborhood;
  final String city;
  final String stateCode;
  final String state;
  final String region;
  final String ibgeCode;
  final String giaCode;
  final String areaCode;
  final String siafiCode;

  const ViaCepModel({
    required this.zipCode,
    required this.street,
    required this.complement,
    required this.unit,
    required this.neighborhood,
    required this.city,
    required this.stateCode,
    required this.state,
    required this.region,
    required this.ibgeCode,
    required this.giaCode,
    required this.areaCode,
    required this.siafiCode,
  });

  ViaCepModel copyWith({
    String? zipCode,
    String? street,
    String? complement,
    String? unit,
    String? neighborhood,
    String? city,
    String? stateCode,
    String? state,
    String? region,
    String? ibgeCode,
    String? giaCode,
    String? areaCode,
    String? siafiCode,
  }) {
    return ViaCepModel(
      zipCode: zipCode ?? this.zipCode,
      street: street ?? this.street,
      complement: complement ?? this.complement,
      unit: unit ?? this.unit,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      stateCode: stateCode ?? this.stateCode,
      state: state ?? this.state,
      region: region ?? this.region,
      ibgeCode: ibgeCode ?? this.ibgeCode,
      giaCode: giaCode ?? this.giaCode,
      areaCode: areaCode ?? this.areaCode,
      siafiCode: siafiCode ?? this.siafiCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': zipCode,
      'logradouro': street,
      'complemento': complement,
      'unidade': unit,
      'bairro': neighborhood,
      'localidade': city,
      'uf': stateCode,
      'estado': state,
      'regiao': region,
      'ibge': ibgeCode,
      'gia': giaCode,
      'ddd': areaCode,
      'siafi': siafiCode,
    };
  }

  factory ViaCepModel.fromMap(Map<String, dynamic> map) {
    return ViaCepModel(
      zipCode: map['cep']?.toString() ?? '',
      street: map['logradouro']?.toString() ?? '',
      complement: map['complemento']?.toString() ?? '',
      unit: map['unidade']?.toString() ?? '',
      neighborhood: map['bairro']?.toString() ?? '',
      city: map['localidade']?.toString() ?? '',
      stateCode: map['uf']?.toString() ?? '',
      state: map['estado']?.toString() ?? '',
      region: map['regiao']?.toString() ?? '',
      ibgeCode: map['ibge']?.toString() ?? '',
      giaCode: map['gia']?.toString() ?? '',
      areaCode: map['ddd']?.toString() ?? '',
      siafiCode: map['siafi']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ViaCepModel.fromJson(String source) =>
      ViaCepModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ViaCepModel(zipCode: $zipCode, street: $street, complement: $complement, unit: $unit, neighborhood: $neighborhood, city: $city, stateCode: $stateCode, state: $state, region: $region, ibgeCode: $ibgeCode, giaCode: $giaCode, areaCode: $areaCode, siafiCode: $siafiCode)';
  }

  @override
  bool operator ==(covariant ViaCepModel other) {
    if (identical(this, other)) return true;

    return other.zipCode == zipCode &&
        other.street == street &&
        other.complement == complement &&
        other.unit == unit &&
        other.neighborhood == neighborhood &&
        other.city == city &&
        other.stateCode == stateCode &&
        other.state == state &&
        other.region == region &&
        other.ibgeCode == ibgeCode &&
        other.giaCode == giaCode &&
        other.areaCode == areaCode &&
        other.siafiCode == siafiCode;
  }

  @override
  int get hashCode {
    return zipCode.hashCode ^
        street.hashCode ^
        complement.hashCode ^
        unit.hashCode ^
        neighborhood.hashCode ^
        city.hashCode ^
        stateCode.hashCode ^
        state.hashCode ^
        region.hashCode ^
        ibgeCode.hashCode ^
        giaCode.hashCode ^
        areaCode.hashCode ^
        siafiCode.hashCode;
  }
}
