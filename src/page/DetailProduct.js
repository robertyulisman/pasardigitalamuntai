import React, {Component, Fragment} from 'react';
import {
  Text,
  View,
  Image,
  TouchableOpacity,
  Alert,
  ScrollView,
  Dimensions,
  FlatList,
  Linking,
} from 'react-native';
import Tags from '../components/atoms/Tags';
import {Warna} from '../../data';
import Counter from '../components/molecules/Counter';
import Modal, {ModalContent, ScaleAnimation} from 'react-native-modals';
import ItemProduct from '../components/molecules/ItemProduct';
import HTML from 'react-native-render-html';
import {dataProduct} from '../../dataProduk';
import NumberFormat from 'react-number-format';
import Axios from 'axios';
import {connect} from 'react-redux';
import {faMoneyBill, faCartArrowDown} from '@fortawesome/free-solid-svg-icons';
import {FontAwesomeIcon} from '@fortawesome/react-native-fontawesome';

const {width} = Dimensions.get('window');

class DetailProduct extends Component {
  constructor() {
    super();
    this.state = {
      isVisible: false,
      biaya: 0,
      spek: '',
      data: [],
      pesanan: [],
      imageSource: '',
      imageShow: false,
      titleImageView: '',
    };
  }

  componentDidMount() {
    const id = this.props.navigation.state.params.id;

    const {product} = this.props.data;
    // console.log('produkkk', product);
    const newData = product.filter(item => item.id_kategori_produk === id);

    this.setState({
      data: newData,
    });
  }

  handleBiaya = (value, jumlah, nama, harga) => {
    const pesan = {
      judul_produk: nama,
      jumlahPesan: jumlah,
      harga_jual: harga,
      totalItem: value,
    };

    this.setState({
      pesanan: pesan,
      biaya: value,
    });
  };

  handlePesan = () => {
    const {pesanan} = this.state;

    // data
    const appName = '%2aPasar%20Amuntai%2a';
    // const noWa = '6285349980806';
    const noWa = '6285349308317';
    const urlWa = 'https://api.whatsapp.com/send?phone=';

    //spesifikasi product
    const namaProduct = pesanan.judul_produk;
    const jumlahPesanan = pesanan.jumlahPesan;
    const hargaBarang = pesanan.harga_jual;
    const totalPesanan = pesanan.totalItem;

    // Wa Teks format
    const bold = '%2a';
    const tabEnter = '%0a';
    const spasi = '%20';

    // teks custom
    const idOrderTeks = 'No Pemesanan: ';
    const idOrder = new Date().getTime();
    const order = 'Order';
    const totalHarga = '*Total Harga';
    const kata1 = `Hallo ${appName}, saya mau order :`;
    const kata2 = `${namaProduct} ${jumlahPesanan} x Rp. ${hargaBarang} = Rp. ${totalPesanan}`;
    const teks = `${idOrderTeks}${idOrder}${tabEnter}${kata1}${tabEnter}${kata2}`;

    // replace for input API WA
    const teksReplace = teks.split(' ').join('%20');

    // URL FINAL
    const URL_LENGKAP = `${urlWa}${noWa}&text=${bold}${order}${bold}${tabEnter}${tabEnter}${teksReplace}${tabEnter}${tabEnter}${bold}${totalHarga}${bold}${tabEnter}Rp.${spasi}${totalPesanan}&source=&data=&app_absent=`;

    if (
      pesanan.length === 0 ||
      pesanan.jumlahPesan === 0 ||
      pesanan.jumlahPesan === undefined
    ) {
      Alert.alert('Upsss...', 'silahkan masukkan jumlah pesanan anda');
    } else {
      Linking.openURL(URL_LENGKAP);
      this.setState({isVisible: false});
    }
  };

  render() {
    const {
      spek,
      titleImageView,
      data,
      pesanan,
      imageSource,
      imageShow,
    } = this.state;
    const nama = this.props.navigation.state.params.nama;
    // console.warn('data', data.length);
    return (
      <View style={{flex: 1}}>
        {/* isi konten */}
        <View style={{flex: 1}}>
          {/* background */}
          <View
            style={{
              width: '100%',
              height: 480,
              backgroundColor: Warna.putih,
              position: 'absolute',
              zIndex: -999,
              borderBottomLeftRadius: 5,
              borderBottomRightRadius: 5,
            }}>
            <Image
              style={{
                width: undefined,
                height: undefined,
                resizeMode: 'contain',
                flex: 1,
              }}
              source={require('../../img/top.png')}
            />
          </View>
          {/* background batas bawah */}

          <View style={{marginHorizontal: 20, marginVertical: 30}}>
            <View
              style={{flexDirection: 'row', justifyContent: 'space-between'}}>
              <Text
                style={{
                  color: Warna.putih,
                  fontSize: 22,
                  // fontWeight: 'bold',
                  fontFamily: 'Poppins-Medium',
                }}>
                Pilih
              </Text>
              <TouchableOpacity>
                <FontAwesomeIcon
                  icon={faCartArrowDown}
                  size={25}
                  style={{color: Warna.hitam, marginRight: 5}}
                />
              </TouchableOpacity>
            </View>
            <Text
              style={{
                color: Warna.putih,
                fontSize: 18,
                fontFamily: 'Poppins-Medium',
                marginTop: -10,
              }}>
              Produk {nama}
            </Text>
          </View>
          {/* <View style={{marginTop: 20}}>
            <Tags title={nama} />
          </View> */}
          {data.length > 0 ? (
            <FlatList
              keyExtractor={item => item.id_produk}
              data={data}
              initialNumToRender={10}
              renderItem={({item}) => (
                <ItemProduct
                  Hide
                  key={item.id_produk}
                  onPressSpek={() => {
                    this.setState({
                      pesanan: item,
                      spek: item.konten_produk,
                      isVisible: true,
                    });
                  }}
                  nama={item.judul_produk}
                  harga={item.harga_jual}
                  // stok={`Stok ${item.stok}`}
                  onhandleJumlah={(value, jumlah, nama, harga) =>
                    this.handleBiaya(value, jumlah, nama, harga)
                  }
                  image={{
                    uri: `https://pasardigitalamuntai.com/assets/images/produk/${
                      item.gambar_produk
                    }`,
                  }}
                  onPressImage={() =>
                    this.setState({
                      imageShow: true,
                      imageSource: item.gambar_produk,
                      titleImageView: item.judul_produk,
                    })
                  }
                  imageView={[
                    {
                      uri: `https://pasardigitalamuntai.com/assets/images/produk/${imageSource}`,
                    },
                  ]}
                  imageViewVisible={imageShow}
                  imageViewVisibleClose={() =>
                    this.setState({imageShow: false})
                  }
                  titleImage={titleImageView}
                />
              )}
            />
          ) : (
            <View
              style={{flex: 1, alignItems: 'center', justifyContent: 'center'}}>
              <Text>tidak ada data untuk kategori {nama}</Text>
            </View>
          )}
        </View>
        {/* modal */}
        <Modal
          visible={this.state.isVisible}
          width={0.9}
          overlayOpacity={0.7}
          rounded
          useNativeDriver
          actionsBordered
          swipeDirection={['down', 'up']}
          modalAnimation={new ScaleAnimation()}
          onSwipeOut={() => {
            this.setState({isVisible: false});
          }}
          onTouchOutside={() => {
            this.setState({isVisible: false});
          }}>
          <ModalContent>
            <View>
              {spek === '' ? (
                <Text
                  style={{
                    textAlign: 'left',
                    alignSelf: 'flex-start',
                    fontSize: 16,
                    marginBottom: 20,
                  }}>
                  'tidak ada keterangan untuk item ini'
                </Text>
              ) : (
                <View
                  style={{
                    borderWidth: 1,
                    borderColor: Warna.putih,
                    padding: 20,
                  }}>
                  <HTML html={spek} />
                </View>
              )}
            </View>

            <TouchableOpacity
              onPress={() => {
                this.setState({isVisible: false});
              }}
              style={{
                paddingVertical: 10,
                paddingHorizontal: 25,
                marginTop: 20,
                backgroundColor: Warna.merah,
                alignItems: 'center',
                justifyContent: 'center',
                alignSelf: 'center',
                borderRadius: 5,
              }}>
              <Text style={{fontSize: 14, color: Warna.putih}}>Tutup</Text>
            </TouchableOpacity>
          </ModalContent>
        </Modal>
        {/* modal batas bawah */}
      </View>
    );
  }
}

const mapStateToProps = state => ({
  data: state.data,
});

export default connect(mapStateToProps)(DetailProduct);
