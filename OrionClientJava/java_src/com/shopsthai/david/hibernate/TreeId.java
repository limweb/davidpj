package com.shopsthai.david.hibernate;

// Generated Nov 14, 2013 10:42:18 PM by Hibernate Tools 3.4.0.CR1

/**
 * TreeId generated by hbm2java
 */
public class TreeId implements java.io.Serializable {

	private String node;
	private Integer left;
	private Integer right;
	private Integer depth;

	public TreeId() {
	}

	public TreeId(String node, Integer left, Integer right, Integer depth) {
		this.node = node;
		this.left = left;
		this.right = right;
		this.depth = depth;
	}

	public String getNode() {
		return this.node;
	}

	public void setNode(String node) {
		this.node = node;
	}

	public Integer getLeft() {
		return this.left;
	}

	public void setLeft(Integer left) {
		this.left = left;
	}

	public Integer getRight() {
		return this.right;
	}

	public void setRight(Integer right) {
		this.right = right;
	}

	public Integer getDepth() {
		return this.depth;
	}

	public void setDepth(Integer depth) {
		this.depth = depth;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TreeId))
			return false;
		TreeId castOther = (TreeId) other;

		return ((this.getNode() == castOther.getNode()) || (this.getNode() != null
				&& castOther.getNode() != null && this.getNode().equals(
				castOther.getNode())))
				&& ((this.getLeft() == castOther.getLeft()) || (this.getLeft() != null
						&& castOther.getLeft() != null && this.getLeft()
						.equals(castOther.getLeft())))
				&& ((this.getRight() == castOther.getRight()) || (this
						.getRight() != null && castOther.getRight() != null && this
						.getRight().equals(castOther.getRight())))
				&& ((this.getDepth() == castOther.getDepth()) || (this
						.getDepth() != null && castOther.getDepth() != null && this
						.getDepth().equals(castOther.getDepth())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getNode() == null ? 0 : this.getNode().hashCode());
		result = 37 * result
				+ (getLeft() == null ? 0 : this.getLeft().hashCode());
		result = 37 * result
				+ (getRight() == null ? 0 : this.getRight().hashCode());
		result = 37 * result
				+ (getDepth() == null ? 0 : this.getDepth().hashCode());
		return result;
	}

}
