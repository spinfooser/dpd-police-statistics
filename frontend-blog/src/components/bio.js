/**
 * Bio component that queries for data
 * with Gatsby's useStaticQuery component
 *
 * See: https://www.gatsbyjs.com/docs/use-static-query/
 */

import React from "react"
import {useStaticQuery, graphql} from "gatsby"
import Image from "gatsby-image"

const Bio = () => {
  const data = useStaticQuery(graphql`
      query BioQuery {
          joshAvatar: file(absolutePath: { regex: "/josh-profile.png/" }) {
              childImageSharp {
                  fixed(width: 50, height: 50, quality: 95) {
                      ...GatsbyImageSharpFixed
                  }
              }
          },
          waveAvatar: file(absolutePath: { regex: "/placeholder-profile.jpg/" }) {
              childImageSharp {
                  fixed(width: 50, height: 50, quality: 95) {
                      ...GatsbyImageSharpFixed
                  }
              }
          }
          site {
              siteMetadata {
                  authors {
                      name
                      summary
                  }
                  social {
                      twitter
                  }
              }
          }
      }
  `)

  // Set these values by editing "siteMetadata" in gatsby-config.js
  const authors = data.site.siteMetadata?.authors
  const social = data.site.siteMetadata?.social

  const avatar = (name) => {
    if(name === 'Josh Mattila') {
      return data?.joshAvatar?.childImageSharp?.fixed
    } else if(name === 'Waverly Hinton') {
      return data?.waveAvatar?.childImageSharp?.fixed
    }
  }

  return (
    <div>
      {authors && authors.map((author) =>
        <div className="bio">
          {avatar && (
            <Image
              fixed={avatar(author?.name)}
              alt={author?.name || ``}
              className="bio-avatar"
              imgStyle={{
                borderRadius: `50%`,
              }}
            />
          )}
          {author?.name && (
            <p>
              Co-authored by <strong>{author.name}</strong> {author?.summary || null}
              {` `}
            </p>
          )}
        </div>
      )}
    </div>
  )
}

export default Bio
