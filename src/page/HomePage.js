import React, {Component} from 'react';
import {Text, View, ScrollView, Image, TouchableOpacity} from 'react-native';
import {Warna} from '../../data';
import Menu from '../components/molecules/Menu';
import Tentang from './Tentang';
import Tags from '../components/atoms/Tags';
import {SliderBox} from 'react-native-image-slider-box';
import ImageSlider from '../components/molecules/ImageSlider';
import {connect} from 'react-redux';

import Pembayaran from './Pembayaran';
import {
  faMoneyBill,
  faChartArea,
  faCartArrowDown,
  faTimes,
} from '@fortawesome/free-solid-svg-icons';
import {FontAwesomeIcon} from '@fortawesome/react-native-fontawesome';
import RBSheet from 'react-native-raw-bottom-sheet';
import Keranjang from '../components/molecules/Keranjang';

class HomePage extends Component {
  constructor() {
    super();
    this.state = {
      visible: false,
      pembayaran: false,
      images: [
        require('../../img/slider/1.jpg'),
        require('../../img/slider/2.jpg'), // Local image
      ],
    };
  }
  render() {
    const {visible, pembayaran} = this.state;
    const {slide} = this.props.data;
    console.log('data slide', slide);

    const dataImage = [];
    for (let i = 0; i < slide.length; i++)
      dataImage.push({
        uri: `https://pasardigitalamuntai.com/assets/images/slide/${
          slide[i].gambar_slide
        }`,
      });

    const getTimeNow = () => {
      const today = new Date();
      const curHr = today.getHours();
      if (curHr < 12) {
        console.log('good morning');
        return 'Pagi';
      } else if (curHr < 18) {
        console.log('good afternoon');
        return 'Siang';
      } else {
        console.log('good evening');
        return 'Malam';
      }
    };

    return (
      <View style={{flex: 1}}>
        <View
          style={{
            width: '100%',
            height: 480,
            backgroundColor: Warna.putih,
            position: 'absolute',
            zIndex: -999,
            borderBottomLeftRadius: 5,
            borderBottomRightRadius: 5,
            justifyContent: 'flex-start',
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
        {visible && (
          <View
            style={{
              position: 'absolute',
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              padding: 10,
              flex: 1,
              backgroundColor: Warna.hitamTransparant,
              shadowColor: '#000',
              shadowOffset: {
                width: 0,
                height: 2,
              },
              shadowOpacity: 0.23,
              shadowRadius: 2.62,
              zIndex: 999,

              elevation: 4,
            }}>
            <Tentang onCancell={() => this.setState({visible: false})} />
          </View>
        )}
        {pembayaran && (
          <View
            style={{
              position: 'absolute',
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              padding: 10,
              flex: 1,
              backgroundColor: Warna.hitamTransparant,
              shadowColor: '#000',
              shadowOffset: {
                width: 0,
                height: 2,
              },
              shadowOpacity: 0.23,
              shadowRadius: 2.62,
              zIndex: 999,

              elevation: 4,
            }}>
            <Pembayaran onCancell={() => this.setState({pembayaran: false})} />
          </View>
        )}
        <RBSheet
          ref={ref => {
            this.RBSheet = ref;
          }}
          height={400}
          openDuration={250}>
          <Keranjang close={() => this.RBSheet.close()} />
        </RBSheet>

        <ScrollView>
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
                Selamat
              </Text>
              <TouchableOpacity onPress={() => this.RBSheet.open()}>
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
                fontSize: 22,
                fontFamily: 'Poppins-Medium',
              }}>
              {getTimeNow()}
            </Text>
          </View>

          <View style={{height: 220}}>
            {/* header/ slider Image */}

            <ImageSlider image={dataImage} />
          </View>
          {/* tags */}
          <View
            style={{
              flexDirection: 'row',
              justifyContent: 'space-between',
              flex: 1,
              marginHorizontal: 10,
              alignItems: 'center',
            }}>
            <Text
              style={{
                color: Warna.putih,
                fontSize: 16,
                fontFamily: 'Poppins-Medium',
              }}>
              Layanan
            </Text>
            <TouchableOpacity
              onPress={() => this.setState({pembayaran: true})}
              style={{
                paddingHorizontal: 15,
                paddingVertical: 7,
                backgroundColor: Warna.putih,
                borderRadius: 5,
                shadowColor: '#000',
                shadowOffset: {
                  width: 0,
                  height: 1,
                },
                shadowOpacity: 0.22,
                shadowRadius: 2.22,

                elevation: 3,
                flexDirection: 'row',
                alignItems: 'center',
              }}>
              <FontAwesomeIcon
                icon={faMoneyBill}
                size={25}
                style={{color: Warna.hitam, marginRight: 5}}
              />
              <Text
                style={{
                  color: Warna.hitam,
                  fontSize: 14,
                  fontFamily: 'Poppins-Medium',
                }}>
                Cara Pembayaran
              </Text>
            </TouchableOpacity>
          </View>
          {/* <Tags title="Layanan" /> */}

          {/* menu atas */}
          <View>
            <Menu showAbout={() => this.setState({visible: true})} />
          </View>

          {/* menu bawah */}
        </ScrollView>
      </View>
    );
  }
}

const mapStateToProps = state => ({
  data: state.data,
});

export default connect(mapStateToProps)(HomePage);
