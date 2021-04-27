import React from 'react';
import { Query } from 'react-apollo';
import gql from 'graphql-tag';

const LibraryQuery = gql`
  {
    items {
      id
      title
      user {
        email
      }
    }
  }
`;

export default () => (
  <Query query={LibraryQuery}>
    {({ data, loading }) => (
      <div>
        {loading
          ? 'loading...'
          : data.items.map(({ title, id, user }) => (
            <div key={id}>
                <b>{title}</b> <i>{user ? `added by ${user.email}` : null}</i>
              </div>
            ))}
      </div>
    )}
  </Query>
);