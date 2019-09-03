import React, { Component } from 'react';

class Alert extends Component {

  render(){
    let message = this.props.liked ? 'Link liked' : 'Link unliked'
    return(
      <div className="alert alert-info alert-dismissible fade show m-1" role="alert">
       {message}
        <button onClick={this.props.closeAlert} type="button" className="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    )
  }

}

export default Alert;
