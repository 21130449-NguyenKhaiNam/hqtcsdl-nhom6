package model;

import java.sql.Date;

public class Product {
    private String id;
    private String name;
    private String material;
    private double dimension;
    private String img;
    private String kind;
    private String trademark;
    private String description;
    private int amount;
    private String color;
    private double price;
    private Date dateAdded;

    public Product(String id, String name, String material, double dimension, String img, String kind, String trademark,
                   String description, int amount, String color, double price, Date dateAdded) {
        super();
        this.id = id;
        this.name = name;
        this.material = material;
        this.dimension = dimension;
        this.img = img;
        this.kind = kind;
        this.trademark = trademark;
        this.description = description;
        this.amount = amount;
        this.color = color;
        this.price = price;
        this.dateAdded = dateAdded;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public double getDimension() {
        return dimension;
    }

    public void setDimension(double dimension) {
        this.dimension = dimension;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getTrademark() {
        return trademark;
    }

    public void setTrademark(String trademark) {
        this.trademark = trademark;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(Date dateAdded) {
        this.dateAdded = dateAdded;
    }

    public boolean checkKind(String targetKind) {
        return this.kind.equals(targetKind);
    }

}
