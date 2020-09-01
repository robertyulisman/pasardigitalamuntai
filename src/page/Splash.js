import React, {Component} from 'react';
import {Text, View, Image, Dimensions, ActivityIndicator} from 'react-native';
import {Warna} from '../../data';
import {
  getCategory,
  getProduct,
  getProfile,
  getKonsultasi,
  getPomo,
  getSlide,
  getSosmed,
  getInfo,
  getPembayaran,
} from '../../config/redux/actions/dataAction';
import PropTypes from 'prop-types';
import {connect} from 'react-redux';

const {width, height} = Dimensions.get('window');

class Splash extends Component {
  componentDidMount() {
    this.props.getProduct();
    this.props.getProfile();
    this.props.getCategory();
    this.props.getKonsultasi();
    this.props.getPomo();
    this.props.getSlide();
    this.props.getSosmed();
    this.props.getInfo();
    this.props.getPembayaran();
  }

  render() {
    return (
      <View
        style={{
          flex: 1,
          height: height,
          width: width,
          backgroundColor: Warna.putih,
          alignItems: 'center',
          justifyContent: 'center',
        }}>
        <View style={{height: 150, width: 200}}>
          <Image
            style={{
              height: undefined,
              width: undefined,
              flex: 1,
              resizeMode: 'contain',
            }}
            source={require('../../img/logo.png')}
          />
        </View>

        <ActivityIndicator
          style={{marginTop: 100}}
          size="large"
          color={Warna.merah}
        />
      </View>
    );
  }
}

Splash.propTypes = {
  data: PropTypes.object.isRequired,
};

const mapStateToProps = state => ({
  data: state.data,
});

export default connect(
  mapStateToProps,
  {
    getCategory,
    getProduct,
    getProfile,
    getKonsultasi,
    getPomo,
    getSlide,
    getSosmed,
    getInfo,
    getPembayaran,
  },
)(Splash);
