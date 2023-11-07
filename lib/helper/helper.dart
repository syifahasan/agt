import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget getIconFromAsset(String iconName, {double w = 0.0, double h = 0.0}) {
  if (w != 0 || h != 0) {
    return SvgPicture.asset('assets/icons/${iconName}.svg',
        width: w, height: h);
  }

  return SvgPicture.asset('assets/icons/${iconName}.svg');
}

String getTermsAndCondition() {
  return "Layanan pada applikasi ini, hanya disediakan untuk pengunjung yang telah mendaftar dan pengunjung harus mendaftar dengan memberikan data-data yang benar di lengkapi dengan user ID untuk menggunakannya. Sebagai pengunjung yang terdaftar, Anda diwajibkan untuk mengikuti segala peraturan pengunjungan layanan tersebut. KEWAJIBAN PENGUNJUNG Pengunjung Viking Apps harus berumur 17 tahun ke atas dan harus tunduk pada hukum dan peraturan perundangan dalam wilayah Republik Indonesia. Anda dilarang untuk memuat atau meneruskan melalui Viking Apps materi atau hal lainnya yang: Memuat atau meneruskan melalui Viking Apps materi atau hal lainnya yang menyinggung, memicu pertentangan dan atau permusuhan antar Suku, Agama, Ras, dan Antar Golongan (SARA). Melanggar hukum, mengancam, menghina, melecehkan, memfitnah, mencemarkan, memperdaya, curang, atau menimbulkan kebencian pada orang atau golongan tertentu. Melanggar atau menyalahi hak orang lain, termasuk tanpa kecuali, hak paten, merek dagang, rahasia dagang, hak cipta, publisitas atau hak milik lainnya. Menganiaya, melecehkan, merendahkan atau mengintimidasi individu atau grup individu berdasarkan agama, jenis kelamin, orientasi seksual, ras, etnis, usia atau cacat fisik. Melanggar norma kesusilaan, cabul, pornografi. Menganjurkan atau menyarankan perbuatan yang melanggar hukum. Memuat kata-kata atau gambar-gambar yang kasar, kotor, jorok, dan sumpah serapah. Menyebarkan ideologi atau ajaran tertentu yang pada prinsipnya dilarang oleh hukum yang berlaku di wilayah Republik Indonesia. Menyebarkan berkas atau program yang mengandung virus atau kode komputer lainnya yang merusak, mengganggu, dan/atau membatasi fungsi dari perangkat lunak atau perangkat keras komputer dan/atau peralatan komunikasi, dan/atau memperbolehkan penggunaan komputer dan/atau jaringan komputer yang tidak sah. Dalam penggunaan Viking Apps. Anda setuju untuk: Memberikan informasi yang akurat, baru dan lengkap tentang diri Anda saat mengisi formulir pendaftaran padaViking Apps. Menjaga keamanan sandi (password) dan identifikasi Anda. Menjaga dan secara berkala memperbarui informasi tentang diri Anda dan informasi lainnya secara akurat, baru dan lengkap. Menerima seluruh risiko dari akses ilegal atas informasi dan data registrasi. Bertanggung jawab atas perlindungan dan pencadangan data dan/atau peralatan yang digunakan. Anda tidak diperbolehkan menggunakan Viking Apps dalam kondisi atau cara apapun yang dapat merusak, melumpuhkan, membebani dan/atau mengganggu server atau jaringan Viking Apps. Anda juga tidak diperbolehkan untuk mengakses layanan, akun pengguna, sistem komputer atau jaringan secara tidak sah, dengan cara perentasan (hacking), password mining, dan/atau cara lainnya. Kami akan bekerja sama secara penuh dengan setiap pejabat penegak hukum atau perintah pengadilan yang meminta atau mengarahkan kami untuk mengungkapkan identitas dari siapapun yang memuati materi atau informasi seperti tersebut di atas.";
}

String convertDate(String date) {
  return "";
}
