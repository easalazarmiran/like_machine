import React, { Component } from 'react';
import Alert from './Alert'

class LikeButton extends Component {

  constructor(props){
    super(props);
    this.state = {
      like_count: props.like_count,
      liked_by_user: props.liked_by_user,
      link_id: props.link_id,
      show_alert: false
    }
  }

  handleLike(){
    let options = {
      link_id: this.state.link_id,
      url: '/likes',
      method: 'POST'
    }

    if(this.state.liked_by_user) {
      options.url = `/likes/${this.state.link_id}`
      options.method = 'DELETE'
    }

    this.callLikeEndpoint(options);
  }


  callLikeEndpoint(options){
    const csrf_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    console.log(options)
    fetch(options.url, {
      method: options.method,
      body: JSON.stringify({ link_id: options.link_id }),
      headers: { "Content-Type": 'application/json',
       'X-Requested-With': 'XMLHttpRequest',
       'X-CSRF-Token': csrf_token }
    })
      .then((response) => {
        if(response.ok) return response.json();
      })
      .then((json)=> {
        this.updateLike()
      })
  }

  closeAlert(){
    console.log('hy')
    this.setState({ show_alert: false })
  }

  updateLike(){
    this.setState((prevState)=> {
      if(prevState.liked_by_user){
        return {
          like_count: (prevState.like_count - 1),
          liked_by_user: false,
          show_alert: true }
      }else{
        return {
          like_count: (prevState.like_count + 1),
          liked_by_user: true,
          show_alert: true }
      }
    })
  }

  render(){
    const { show_alert } = this.state;
    return(
      <div>
        <i className="far fa-thumbs-up" onClick={this.handleLike.bind(this)}></i>
        <p>{this.state.like_count} likes</p>
        { show_alert && <Alert key={this.state.like_count} closeAlert={this.closeAlert.bind(this)} liked={this.state.liked_by_user}/> }
      </div>
      )
  }

}

export default LikeButton;
